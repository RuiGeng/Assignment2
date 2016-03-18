module PizzasHelper
  def checked(area)
  @pizza.toppings.nil? ? false : @pizza.toppings.match(area)
end
end
