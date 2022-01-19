class LetterSharesController < ApplicationController
  def show
    @user = User.find_by!(twitter_id: params[:twitter_id])
    share_image = ShareImage.find(params[:id])
    @share_image = share_image.image_url
  end
end
