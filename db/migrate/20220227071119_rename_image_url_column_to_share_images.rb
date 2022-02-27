class RenameImageUrlColumnToShareImages < ActiveRecord::Migration[6.0]
  def change
    rename_column :share_images, :image_url, :image
  end
end
