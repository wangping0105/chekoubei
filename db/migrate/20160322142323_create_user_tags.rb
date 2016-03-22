class CreateUserTags < ActiveRecord::Migration
  def change
    create_table :user_tags do |t|
      t.integer :tag_id, index: true
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
