class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 255
      t.string :email, limit: 255
      t.string :mobile_no, limit: 15
    end
  end
end
