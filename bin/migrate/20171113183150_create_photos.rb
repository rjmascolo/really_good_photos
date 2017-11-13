class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :photo_id
      t.string :location
      t.float :longitude
      t.float :latitude
      t.integer :category_id

      t.timestamps
    end
  end
end
