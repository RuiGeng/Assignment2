class UsersController < ApplicationController
  # Create by Rui Geng
  #before_filter :authenticate_user!, excpet: [:index]
  #before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(:page => params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user.admin?
      @orders = Order.all.paginate(page: params[:page], :per_page => 5)
    else
      @orders = @user.orders.paginate(page: params[:page], :per_page => 5)
    end
  end

  # GET /users/1/edit
  def edit
  end

  # # POST /users
  # # POST /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:name, :email, :admin)
    end
    
    # # Confirms a logged-in user.
    # def logged_in_user
    #   unless logged_in?
    #     flash[:danger] = "Please log in."
    #     redirect_to user_session_path
    #   end
    # end
end
