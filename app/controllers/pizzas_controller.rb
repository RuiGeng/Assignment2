class PizzasController < ApplicationController
  before_action :set_order, only: [:create]
  before_action :set_pizza, only: [:show]
  
  # GET /order/new
  
  def new
     @pizza = Pizza.new
  end
  
  def show
  end
  
  def create
    @pizza = @order.pizzas.build(pizza_params)
    if @pizza.save
    else
      flash[:alert] = "Pizza failed!"
      render 'new'
    end
  end
  
  private
    def set_pizza
      @pizza = Pizza.find(params[:id])
    end
  
    def set_order
      @order = Order.find(session[:order_id])
      rescue ActiveRecord::RecordNotFound
      @order = Order.create
      session[:order_id] = @order.id
    end  
    
    def pizza_params
      params.require(:pizza).permit(:type, :size, :toppings, :crust, :order_id)
    end
    
end
