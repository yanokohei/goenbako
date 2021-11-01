class Api::LettersController < ApplicationController
  before_action :set_letter, only: [:edit :update, :destroy]

  def index
    @letters = Letter.all
    render json: @letters
  end

  def show
    render json: @letter
  end

  def create
    @letter = Letter.new(letter_params)

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

  private
  def set_letter
    @letter = current_user.letters.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit(:to_user_id, :past, :current, :future, :expect, :message)
  end
end
