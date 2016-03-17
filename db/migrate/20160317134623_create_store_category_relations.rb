class CreateStoreCategoryRelations < ActiveRecord::Migration
  def change
    create_table :store_category_relations do |t|
      t.integer :store_id, index: true
      t.integer :store_category_id, index: true

      t.timestamps null: false
    end
  end
end
