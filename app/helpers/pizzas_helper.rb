module PizzasHelper
  # Create by Rui Geng
  def checked(area)
    @pizza.toppings.nil? ? false : @pizza.toppings.match(area)
  end
end
