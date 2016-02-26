class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :pinyin
      t.integer :sort

      t.timestamps
    end
    add_index :countries, :name
    add_index :countries, :pinyin
  end
end
