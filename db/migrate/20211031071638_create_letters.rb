class CreateLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :letters do |t|
      t.integer :to_user_id, null: false
      t.string :past
      t.string :current
      t.string :future
      t.string :expect
      t.string :message
      t.references :from_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
