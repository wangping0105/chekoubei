class CreateAuthApplies < ActiveRecord::Migration
  def change
    create_table :auth_applies do |t|
      t.integer :user_id, index: true
      t.string :true_name
      t.text :extra
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
