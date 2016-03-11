class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:show]
  
  def index
  end

  def show
    if current_user.admin != true
        flash[:notice] = "You are not adminstrator"
    else
        flash[:notice] = "You are adminstrator"
    end
  end
end
