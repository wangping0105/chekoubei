class CreateStoreCategories < ActiveRecord::Migration
  def change
    create_table :store_categories do |t|
      t.string :name, index: true
      t.string :pinyin, index: true
      t.integer :parent_id, index: true

      t.timestamps null: false
    end
  end
end
