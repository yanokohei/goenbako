class Api::LettersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_letter, only: [:update, :destroy]

  def create
    @letter = current_user.letters.build(letter_params)
    if @letter.save
      render json: @letter
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

  def destroy
    @letter.destroy!
    render json: @letter
  end

  private
  def set_letter
    @letter = current_user.letters.find_by(id: params[:id]) || current_user.receivers.find_by(id: params[:id])
  end

  def letter_params
    params.require(:letter).permit(:past, :current, :future, :expect, :message, :sender_id, :receiver_id)
  end
end
