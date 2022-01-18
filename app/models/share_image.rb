class ShareImage < ApplicationRecord
  mount_uploader :image_url, ShareImageUploader
  belongs_to :letter
end
