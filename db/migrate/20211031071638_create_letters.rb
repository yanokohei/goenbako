class CreateLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :letters do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.integer :receiver_id, null: false
      t.string :past
      t.string :current
      t.string :future
      t.string :expect
      t.string :message

      t.timestamps
    end
  end
end
