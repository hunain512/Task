class CartItemsController < ApplicationController
  def create
    current_item = Item.find(params[:item_id]) 
    current_cart = @current_cart 
    if cart =  current_cart.cart_items.include?(current_item)
      @cart_item = current_cart.cart_items.find_by(:item_id => current_item)
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
      @cart_item.cart = current_cart 
      @cart_item.item = current_item    
    
    end 
    @cart_item.save 
    redirect_to cart_path(current_cart)
  end   

  def destroy 
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy 
    redirect_to cart_path(@current_cart)
  end   

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity +=1
    @cart_item.save 
    redirect_to cart_path(@current_cart) 
  end   

  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -=1
    end   
    @cart_item.save 
    redirect_to cart_path(@current_cart)
  end 
end   