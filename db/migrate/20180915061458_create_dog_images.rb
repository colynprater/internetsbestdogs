class CreateDogImages < ActiveRecord::Migration
  def change
    create_table :dog_images do |t|

      t.timestamps null: false

      t.string  :img_url
      t.integer :user_id
    end
  end
end
