class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name, limit: 255
      t.text :description
      t.references :cuisine, foreign_key: true
      
      t.timestamps
    end
  end
end
