class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
  end
  
  
  # def show
  #   if current_user.admin != true
  #       flash[:notice] = "You are not adminstrator"
  #   else
  #     respond_to do |format|
  #       #format.html { redirect_to '/users/index', notice: 'You are adminstrator.' }
  #       #format.json { render :index, status: :created, location: @user }
  #     end
  #   end
  # end
end
