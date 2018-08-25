class AddLongitudeLatitudeToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :latitude, :string
    add_column :restaurants, :longitude, :string
  end
end
