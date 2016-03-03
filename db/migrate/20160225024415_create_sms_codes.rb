class CreateSmsCodes < ActiveRecord::Migration
  def change
    create_table :sms_codes do |t|
      t.references :users, index: true
      t.string :phone, index: true
      t.string :code
      t.integer :sms_type

      t.timestamps null: false
    end
  end
end
