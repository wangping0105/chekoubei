class CreateStoreCars < ActiveRecord::Migration
  def change
    create_table :store_cars do |t|
      t.string :title
      t.integer :store_id, index: true
      t.integer :car_id, index: true
      t.float :prices
      t.integer :status, default: 0
      t.boolean :top, default: false

      t.timestamps null: false
    end
  end
end
