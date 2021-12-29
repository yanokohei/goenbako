class Api::ShareImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @share_image = ShareImage.new(share_image_params)
      if @share_image.save
        render json: @share_image, status: :ok
    else
      render json: @share_image, status: :bad_request
    end
  end

  private

  def share_image_params
    params.require(:share_image).permit(:letter_id, :topic, :image_url)
  end
end
