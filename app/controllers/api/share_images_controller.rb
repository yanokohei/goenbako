class Api::ShareImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @share_image = ShareImage.new(share_image_params)
      base64_url = @share_image.image_url['data:image/png;base64,'.length .. -1]
      decoded_data = Base64.decode64(base64_url)
      filename = Time.zone.now.to_s + '.' + 'png'
      File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
        f.write(decoded_data)
        @share_image.image_url = f
      end
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
