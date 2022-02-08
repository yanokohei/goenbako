class Api::SettingsController < ApplicationController

  def update
    current_user.assign_attributes(user_params)
    if current_user.save
      render json: current_user, status: :ok
    else
      render json: current_user, status: :bad_request
    end
  end

  def destroy
    current_user.destroy!
  end

  private

  def user_params
    params.permit(:email)
  end
end
