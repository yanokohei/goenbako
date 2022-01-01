class CreateShareImages < ActiveRecord::Migration[6.0]
  def change
    create_table :share_images do |t|
      t.references :letter, null: false
      t.string :topic, null: false
      t.text :image_url, null: false

      t.timestamps
    end
  end
end
