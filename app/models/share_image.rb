class ShareImage < ApplicationRecord
  mount_uploader :image, ShareImageUploader
  belongs_to :letter
end
