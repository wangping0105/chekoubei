class CreateStoreUsers < ActiveRecord::Migration
  def change
    create_table :store_users do |t|
      t.integer :store_id, index: true
      t.string :phone, index: true
      t.string :name
      t.integer :sex
      t.string :avatar
      t.string :authentication_token, index: true
      t.string :password_digest
      t.datetime :activated
      t.boolean :admin, default: false
      t.integer :deleted_at

      t.timestamps null: false
    end
  end
end
