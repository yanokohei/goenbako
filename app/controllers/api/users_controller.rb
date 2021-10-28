class Api::UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def me
    @user = User.find(current_user.id)
    render json: @user
  end

  def edit; end

  def update; end

  def destroy
    @user = User.find(params[:id])
    render json: @user
  end
end
