class CreateUserDevices < ActiveRecord::Migration
  def change
    create_table :user_devices do |t|
      t.string :uid
      t.string :device_token
      t.string :client_id
      t.integer :platform
      t.references :user, index: true
      t.references :organization, index: true

      t.timestamps
    end
  end
end
