class CreateCuisines < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisines do |t|
      t.string :name, limit: 255
      t.text :description

      t.timestamps
    end
  end
end
