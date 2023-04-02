class StoresController < ApplicationController
  # before_action :find_store, only: [:show, :update, :destroy ]
  before_action :require_admin, only: [:edit, :new]
  def index
    @stores = Store.all 
  end 

  def show
    @store = Store.find(params[:id]) 
    @users = @store.users
    @categories = @store.categories 
  end   

  def new 
     @store = Store.new
  end 

  def create  
    @store = Store.new(set_params)
    @store.user = current_user
    if @store.save 
      flash[:notice] = "you have created the store successfully "
      redirect_to @store
    else
      render 'new' 
    end     
  end   

  def edit  
  end 
  
  def update
    if @store.update(set_params)
     flash[:notice] = "you have update the store successfully" 
     redirect_to store_path(@store)
    else 
     render 'edit' 
    end    
  end 

  def destroy 
      if @store.destroy
        flash[:notice] = "you are successfully deleted that store"
        redirect_to stores_path 
      end   
    end   
  
  private 
   
   def find_store
    @store = Store.find(params[:id]) 
   end  

   def set_params
    params.require(:store).permit(:name, user_ids:[] )
   end  

   def require_admin
    if current_user.admin?
     @store = Store.find(params[:id])
    else 
     redirect_to root_path  
    end 
  end 
end  
