class Api::TwitterDataController < ApplicationController
  before_action :require_login

  def update
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:twitter_api_key]
      config.consumer_secret = Rails.application.credentials.twitter[:twitter_api_secret]
    end
    data = client.user(current_user.twitter_id)
    current_user.update!(name: data[:name],
                         twitter_id: data[:screen_name],
                         image: data[:profile_image_url_https],
                         introduce: data[:description])
    render json: current_user, status: :ok
  end
end
