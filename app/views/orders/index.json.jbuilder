json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :orderDate, :firstName, :lastName, :phoneNumber, :email, :addressLine1, :addressLine2, :province, :city, :postalCode, :subtotal, :tax, :total
  json.url order_url(order, format: :json)
end
