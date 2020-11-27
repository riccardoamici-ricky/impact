class CategoriesController < ApplicationController
  def index
    if params[:query].present?
      @categories = Category.where("category ILIKE ?", "%#{params[:query]}%")
    else
      @categories = Category.all
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category: @category)
  end
end
