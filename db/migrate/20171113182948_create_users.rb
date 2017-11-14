class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :home_location
      t.float :latitude, :default => true
      t.float :longitude, :default => true

      t.timestamps
    end
  end
end
