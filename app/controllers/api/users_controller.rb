module Api
  class UsersController < ApplicationController
    def sent_letters
      user = User.find_by!(twitter_id: params[:twitter_id])
      sent_letters = user.letters.order(created_at: :desc)
      sent_letters = sent_letters.map do |letter|
        {
          letter: letter,
          sender: letter.sender,
          receiver: letter.receiver
        }
      end
      render json: sent_letters
    end

    def received_letters
      user = User.find_by!(twitter_id: params[:twitter_id])
      received_letters = user.receivers.order(created_at: :desc)
      received_letters = received_letters.map do |letter|
        {
          letter: letter,
          sender: letter.sender,
          receiver: letter.receiver
        }
      end
      render json: received_letters
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
