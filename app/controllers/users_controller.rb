class UsersController < ApplicationController
  def index 
    @users = User.all
  end   

  def show 
    @user = User.find(params[:id])
    @stores = @user.stores
  end  
  
  def new 
    @user = User.new
  end   
  
end   