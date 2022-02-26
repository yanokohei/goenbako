module CarrierwaveBase64Uploader
  extend ActiveSupport::Concern

  private

    def base64_conversion(uri_str, _filename = 'base64')
      image_data = split_base64(uri_str)
      encode_data = image_data[:data]
      decode_data = Base64.decode64(encode_data)

      temp_img_file = Tempfile.new
      temp_img_file.binmode
      temp_img_file << decode_data
      temp_img_file.rewind

      img_params = {
        filename: "#{SecureRandom.hex}.#{image_data[:extension]}",
        type: image_data[:type],
        tempfile: temp_img_file
      }
      ActionDispatch::Http::UploadedFile.new(img_params)
    end

    def split_base64(uri_str)
      if uri_str.match(/data:(.*?);(.*?),(.*)$/)
        { type: Regexp.last_match(1), encoding: Regexp.last_match(2), data: Regexp.last_match(3), extension: Regexp.last_match(1).split('/')[1] }
      end
    end
end
