class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :pinyin
      t.integer :tag_type, default: 0

      t.timestamps null: false
    end
  end
end
