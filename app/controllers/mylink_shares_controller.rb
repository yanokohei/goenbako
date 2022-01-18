class MylinkSharesController < ApplicationController
  def show
    @user = User.find_by!(twitter_id: params[:twitter_id])
  end
end
