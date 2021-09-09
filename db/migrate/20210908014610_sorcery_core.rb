class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :twitter_id, null: false, unique: true
      t.string :name, null: false
      t.string :image
      t.text :introduce
      t.integer :role, null: false, default: 1

      t.timestamps                null: false
    end

    add_index :users, :twitter_id, unique: true
  end
end
