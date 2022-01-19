class LetterSharesController < ApplicationController
  def show
    @user = User.find_by!(twitter_id: params[:twitter_id])
    @share_image = ShareImage.find(params[:id])
  end
end
