class CreateRestaurantsCuisines < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_cuisines do |t|
      t.references :restaurant, foreign_key: true
      t.references :cuisine, foreign_key: true

      t.timestamps
    end
  end
end
