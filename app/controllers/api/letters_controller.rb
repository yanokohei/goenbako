class Api::LettersController < ApplicationController
  before_action :set_letter, only: [:update, :destroy]

  def create
    @letter = current_user.letters.build(letter_params)
    receiver = User.find_by(id: @letter.receiver_id)
    if @letter.save
      render json: @letter
      unless receiver.email.blank?
        UserMailer.new_letter(letter_params).deliver_later
      end
    else
      render json: @letter.errors, status: :bad_request
    end
  end

  def update
    if @letter.update(letter_params)
      render json: @letter
    else
      render json: @letter.errors, status: :bad_request
    end
  end

  def show
    letter = Letter.find_by(id: params[:id])
    if letter.nil?
      render json: letter
    else
      show_letter = {
        letter: letter,
        sender: letter.sender,
        receiver: letter.receiver
      }
      render json: show_letter
    end
  end

  def destroy
    if params[:sent_case]
      letter = current_user.letters.find(params[:id])
      letter.destroy!
    else
      letter = current_user.receivers.find(params[:id])
      letter.destroy!
    end
    render json: letter
  end

  private

  def set_letter
    @letter = current_user.letters.find_by(id: params[:id]) || current_user.receivers.find_by(id: params[:id])
  end

  def letter_params
    params.require(:letter).permit(:past, :current, :future, :expect, :message, :sender_id, :receiver_id)
  end
end
