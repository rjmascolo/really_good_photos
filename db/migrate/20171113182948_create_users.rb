class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :home_location
      t.float :latitude, :default => nil
      t.float :longitude, :default => nil

      t.timestamps
    end
  end
end
