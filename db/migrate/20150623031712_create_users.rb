class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :store_id, index: true
      t.string :phone, index: true
      t.string :name
      t.integer :sex
      t.string :authentication_token, index: true
      t.string :password_digest
      t.datetime :activated
      t.integer :role, default: 0
      t.integer :identify_status, default: 0
      t.integer :deleted_at

      t.timestamps null: false
    end
  end
end
