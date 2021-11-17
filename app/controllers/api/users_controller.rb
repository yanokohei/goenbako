class Api::UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def me
    render json: current_user
  end

  def edit; end

  def update; end

  def destroy
    @user = User.find(params[:id])
    render json: @user
  end
end
