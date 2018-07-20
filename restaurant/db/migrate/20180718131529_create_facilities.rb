class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :name, limit: 255
      t.text :description

      t.timestamps
    end
  end
end
