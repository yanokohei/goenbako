module Api
  class TwitterFollowListController < ApplicationController
    before_action :require_login, only: :update

    def index
      followings = twitter_client.friends(current_user.twitter_id).take(500)
      users = User.pluck(:twitter_id)
      current_user.letters
      @following_members = followings.select {|following| users.include?(following.screen_name)}
      render 'jb/following_members.json.jb'
    end

    private

    def twitter_client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = Rails.application.credentials.twitter[:twitter_api_key]
        config.consumer_secret     = Rails.application.credentials.twitter[:twitter_api_secret]
        config.access_token        = access_token
        config.access_token_secret = access_token_secret
      end
    end

    def access_token
      @access_token = crypt.decrypt_and_verify(current_user.authentication.access_token)
    end

    def access_token_secret
      @access_token_secret = crypt.decrypt_and_verify(current_user.authentication.access_token_secret)
    end

    def crypt
      key_len = ActiveSupport::MessageEncryptor.key_len
      secret = Rails.application.key_generator.generate_key('salt', key_len)
      ActiveSupport::MessageEncryptor.new(secret)
    end
  end
end
