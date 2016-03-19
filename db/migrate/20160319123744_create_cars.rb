class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :user_id, index: true
      t.integer :brand_id, index: true
      t.string :model_no
      t.string :color
      t.float :distance
      t.date :on_time
      t.text :description
      t.integer :car_type, default: 0

      t.timestamps null: false
    end
  end
end
