class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :address_line1, null: false, default: ""
      t.string :address_line2, null: false, default: ""
      t.string :province, null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.decimal :subtotal, null: false, default: 0
      t.float :tax, null: false, default: 1.13
      t.decimal :total, null: false, default: 0
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :orders, [:user_id, :created_at]
  end
end
