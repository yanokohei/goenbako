class Api::LettersController < ApplicationController
  before_action :set_letter, only: [:edit :update, :destroy]

  def show
    render json: @letter
  end

  def create
    @letter = current_user.letters.build(letter_params)
    if @letter.save
      render json: @letter
    else
      render json: @letter.errors, status: :bad_request
    end
  end

  def edit
    @letter = current_user.find(params[:id])
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

  def sent_letters
    user = User.find(params[:id])
    @sent_letters = user.sent_letters
    render json: @sent_letters
  end

  def received_letters
    user = User.find(params[:id])
    @received_letters = user.received_letters
    render json: @received_letters
  end

  private
  def set_letter
    @letter = current_user.letters.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit(:past, :current, :future, :expect, :message, :receiver_id)
  end
end
