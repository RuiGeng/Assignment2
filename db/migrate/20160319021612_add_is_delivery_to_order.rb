class AddIsDeliveryToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :is_dilivery, :boolean, default: false, null: false, after: :total
  end
end
