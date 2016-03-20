class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]
  before_action :set_pizza, only: [:show, :destroy]
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
      flash[:notice] = "Order was successfully generated."
      redirect_to new_order_pizza_path(:order_id => @order.id)
    else
      flash[:alert] = "Order was failed!"
      render 'new'
    end
  end
  
  # GET /users/1/edit
  def edit
  end
  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
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
                                    :province, :city, :postal_code, :user_id)
    end
end