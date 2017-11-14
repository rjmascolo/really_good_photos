class CreateUsersphotos < ActiveRecord::Migration[5.1]
  def change
    create_table :usersphotos do |t|
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
