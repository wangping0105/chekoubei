class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :pinyin, index: true
      t.string :short_name
      t.text :introduction
      t.integer :category
      t.integer :store_type
      t.string :business_hours
      t.integer :level
      t.integer :order_count
      t.float    :lat
      t.float    :lng

      t.timestamps null: false
    end
    add_index :addresses, [:lat, :lng]
  end
end
