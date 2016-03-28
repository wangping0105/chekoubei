class CreateImUsers < ActiveRecord::Migration
  def change
    create_table :im_users do |t|
      t.string :username
      t.string :password
      t.string :nickname
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
