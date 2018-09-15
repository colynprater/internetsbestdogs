class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :user_id
      t.integer :dog_image_id

      t.timestamps null: false
    end
  end
end
