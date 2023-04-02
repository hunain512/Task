class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update ]
  before_action :require_admin, only: [:edit, :new ]

  def index
    @categories = Category.all 
  end    

  def show 
    @items = @category.items
  end 
  
  def new
     @category = Category.new()    
  end 
  
  def create 
    @category = Category.create(set_param)
    if @category  
      flash[:notice] = "you are created the category successfully"
      redirect_to @category
    else 
      render 'new'
    end     
  end    
  
  def edit
  end   

  def update
    if @category.update(set_param)
      flash[:notice] = "Category name be update successfully"
      redirect_to @category 
    else
      render 'edit' 
    end     
  end   
  private 

    def find_category
      @category = Category.find(params[:id])
    end   

    def set_param
      params.require(:category).permit(:name, :store_id )
    end   
 
    def require_admin
      if current_user.admin?
        @category = Category.find(params[:id])
      else 
        redirect_to root_path  
      end 
    end   
end   