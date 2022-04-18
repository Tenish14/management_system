class CategoriesController < ApplicationController
  before_action :current_category, only: [:edit, :update, :destroy]

  def index
      @categories = Category.all
  end

  def new
      @category  = Category.new
  end

  def create
      @category = Category.new(category_params)
      if @category.save
        flash[:success] = "New Category created"
        redirect_to categories_path
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:warning] = "Category Updated"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:danger] = "Category Deleted"
      redirect_to categories_path
    end
  end
    
  private
      def category_params
        params.require(:category).permit(:name, :description )
      end

      def current_category
        @category = Category.find(params[:id])
      end
end
