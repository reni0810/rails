class CreateRestaurantsFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_facilities do |t|
      t.references :restaurant, foreign_key: true
      t.references :facility, foreign_key: true

      t.timestamps
    end
  end
end
