class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :shout, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:user_id, :shout_id], unique: true
  end
end
