class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]
  
  # GET /order/new
  def new
     @order = Order.new
  end
  
  def show
     @pizzas = @order.pizzas.paginate(page: params[:page])
  end
  
  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:success] = "Order created!"
      redirect_to new_pizza_path
    else
      flash[:alert] = "Order failed!"
      render 'new'
    end
  end


  def destroy
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
  
    def order_params
      params.require(:order).permit(:first_name, :last_name, :phone_number, 
                                    :email, :address_line1, :address_line2,
                                    :province, :city, :postal_code, :user_id)
    end
end