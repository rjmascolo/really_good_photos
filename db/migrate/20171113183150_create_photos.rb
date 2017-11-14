class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :photo_id
      t.string :name
      t.string :description
      t.float :longitude
      t.float :latitude
      t.string :taken_at
      t.string :category
      t.string :location
      t.string :rating
      t.string :image_url

      t.timestamps
    end
  end
end
