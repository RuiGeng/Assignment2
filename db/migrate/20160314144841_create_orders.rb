class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.date :orderDate
      t.string :firstName
      t.string :lastName
      t.string :phoneNumber
      t.string :email
      t.string :addressLine1
      t.string :addressLine2
      t.string :province
      t.string :city
      t.string :postalCode
      t.decimal :subtotal
      t.integer :tax
      t.decimal :total

      t.timestamps null: false
    end
  end
end
