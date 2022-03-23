module Api
  class UsersController < ApplicationController
    before_action :require_login, only: :destroy

    def sent_letters
      user = User.find_by!(twitter_id: params[:twitter_id])
      @sent_letters = user.letters.order(created_at: :desc)
      render 'jb/sent_letters.json.jb'

    end

    def received_letters
      user = User.find_by!(twitter_id: params[:twitter_id])
      @received_letters = user.received_letters.order(created_at: :desc)
      render 'jb/received_letters.json.jb'
    end

    def show
      user = User.find_by(twitter_id: params[:twitter_id])
      render json: user
    end

    def me
      render json: current_user
    end

    def edit; end

    def update; end

    def destroy
      user = User.find(params[:twitter_id])
      render json: user
    end
  end
end
