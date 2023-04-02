class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :current_cart 
    def current_cart 
        if session[:cart_id]
          @current_cart ||= Cart.find(session[:cart_id])
        end
        if session[:cart_id].nil?
          @current_cart = Cart.create!
          session[:cart_id] = @current_cart.id
        end
        @current_cart
        end 
  end   

