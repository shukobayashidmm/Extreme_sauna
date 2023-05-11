class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|
      
      t.string :name, null: false
      t.string :price, null: false
      t.string :business_hour, null: false
      t.float :room_temperature, null: false
      t.float :water_temperature, null: false
      t.integer :prefecture, null: false
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
