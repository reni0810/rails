class CreateRestaurantsCuisinesRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_cuisines_recipes do |t|
      t.references :restaurants_cuisine, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
