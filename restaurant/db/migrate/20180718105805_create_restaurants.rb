class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, limit: 255
      t.string :address, limit: 1000
      t.string :mobile_no, limit: 15
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :restaurants, :mobile_no, unique: true
  end
end
