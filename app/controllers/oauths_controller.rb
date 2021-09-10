class OauthsController < ApplicationController
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if auth_params[:denied].present?
      redirect_to root_path, notice: 'ログインをキャンセルしました。'
      return
    end
    if @user = login_from(provider)
      redirect_to user_path(@user), notice: "#{provider.titleize}ログインしました。"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to user_path(@user), notice: "#{provider.titleize}ログインしました。"
      rescue
        redirect_to root_path, alert: "#{provider.titleize}ログインに失敗しました。"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end