class CreateTimings < ActiveRecord::Migration[5.2]
  def change
    create_table :timings do |t|
      t.string :day, limit: 3
      t.time :start_time
      t.time :end_time
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
