class CreateUnavailabities < ActiveRecord::Migration[5.2]
  def change
    create_table :unavailabities do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :full_day
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
