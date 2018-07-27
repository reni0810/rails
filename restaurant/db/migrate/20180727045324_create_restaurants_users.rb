class CreateRestaurantsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_users do |t|
      t.references :restaurant, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
