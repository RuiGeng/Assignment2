class OrdersController < ApplicationController
  # Create by Rui Geng
  before_action :set_order, only: [:show, :destroy, :edit, :update]
  before_action :set_pizza, only: [:show, :destroy]

  def new
     @order = Order.new
  end
  
  def show
     @pizzas = @order.pizzas.paginate(page: params[:page], :per_page => 5)
  end
  
  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:notice] = "Order was successfully generated."
      redirect_to new_order_pizza_path(:order_id => @order.id)
    else
      flash[:alert] = "Order was failed!"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to user_path(current_user.id), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id), notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
    
    def set_pizza
      @pizzas = Pizza.where(order_id: params[:id])
    end
  
    def order_params
      params.require(:order).permit(:first_name, :last_name, :phone_number, 
                                    :email, :address_line1, :address_line2,
                                    :province, :city, :postal_code, :is_dilivery, :user_id)
    end
end