class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name, index: true
      t.string :pinyin, index: true
      t.string :short_name
      t.text :introduction
      t.integer :store_category_id, index: true
      t.integer :brand_id, index: true
      t.integer :store_type
      t.string :business_hours
      t.integer :level
      t.integer :order_count
      t.integer :deleted_at

      t.timestamps null: false
    end
  end
end
