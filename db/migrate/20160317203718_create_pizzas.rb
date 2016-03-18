class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :pizza_type, null: false, default: ""
      t.decimal :type_price, null: false, default: 0
      t.string :pizza_size, null: false, default: ""
      t.decimal :size_price, null: false, default: 0
      t.string :toppings, null: false, default: ""
      t.decimal :toppings_price, null: false, default: 0
      t.string :crust, null: false, default: ""
      t.decimal :crust_price, null: false, default: 0
      t.decimal :total_price, null: false, default: 0
      t.references :order, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :pizzas, [:order_id, :created_at]
  end
end
