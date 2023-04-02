class ItemsController < ApplicationController
  before_action :require_admin, only: [:edit, :new]
  def index 
    @items = Item.all
  end 
  
  def show 
    if current_user.admin?
     @item = Item.find(params[:id])
    else
      redirect_to root_path
    end   
  end  
  def new 
    if current_user.admin?
     @item = Item.new
    else 
     redirect_to root_path
    end   
  end 
  
  def create 
    @item = Item.create(params.require(:item).permit(:name, :price, :quantity, :category_id))
    if @item 
      flash[:notice] = "item created successfully"
      redirect_to @item 
    else 
      render 'new'
    end     
  end   
  def edit
    if current_user.admin?
     @item = Item.find(params[:id])
    else 
     redirect_to root_path 
    end   
  end   

  def update
    @item = Item.find(params.require(:item).permit(:name, :price, :quantity, :category_id)) 
    if @item.update(params.require(:item).permit(:name, :price, :quantity, :category_id))
      flash[:notice] = "item should be update successfully"
      redirect_to @item 
    else
      render 'edit' 
    end     
  end  
 private 
  def require_admin
    if current_user.admin?
     @store = Store.find(params[:id])
    else 
     redirect_to root_path  
    end 
  end 
end   