class PizzasController < ApplicationController
  before_action :set_order, only: [:create, :new, :finsh]
  before_action :set_pizza, only: [:show]
  
  def new
    @pizza = Pizza.new
  end
  
  def show
  end

  def create
    respond_to do |format|
      @pizzas = @order.pizzas.build(pizza_params)
      if @pizzas.save
        @order = Order.find(@pizzas.order.id)
        @order.update_subtotal
        format.html { redirect_to new_order_pizza_path, notice: 'Pizza was successfully added to the Order.' }
      else
        format.html { redirect_to new_order_path, notice: 'Pizza was failed.' }
      end
    end
  end
  
  private
    def set_pizza
      @pizza = Pizza.find(params[:id])
    end
  
    def set_order
      @order = Order.find(params[:order_id])
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = "Pleae Create an Order first!"
        redirect_to new_order_path
    end  
    
    def pizza_params
      params.require(:pizza).permit(:pizza_type, :pizza_size, :crust, toppings:[])
    end
end
