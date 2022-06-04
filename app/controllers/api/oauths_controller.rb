module Api
  class OauthsController < ApplicationController
    def oauth
      login_at(auth_params[:provider])
    end

    def callback
      provider = auth_params[:provider]
      if auth_params[:denied].present?
        redirect_to root_path, notice: 'ログインをキャンセルしました。'
        return
      end
      if (user = login_from(provider))
        user.authentication.update!(
          access_token: access_token.token,
          access_token_secret: access_token.secret
        )
      else
        fetch_user_data_from(provider)
      end
      redirect_to me_home_path, notice: "#{provider.titleize}ログインしました。"
    end

    private

      def auth_params
        params.permit(:code, :provider, :denied)
      end

      def fetch_user_data_from(provider)
        user_from_provider = build_from(provider)
        user = user_from_provider if user.new_record?
        user.build_authentication(uid: @user_hash[:uid],
                                  provider: provider,
                                  access_token: access_token.token,
                                  access_token_secret: access_token.secret)
        user.save!
        reset_session
        auto_login(@user)
      end
  end
end
