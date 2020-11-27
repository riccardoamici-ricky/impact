class CategoriesController < ApplicationController
  def index
    @images = {
      "Fashion" => "https://res.cloudinary.com/dzpgbbhmm/image/upload/v1606483237/impact/fashion_banner_lhl4gk.jpg",
      "Plants" => "https://res.cloudinary.com/dzpgbbhmm/image/upload/v1606483237/impact/plants_banner_hlhohn.jpg",
      "Food" => "https://res.cloudinary.com/dzpgbbhmm/image/upload/v1606486385/impact/food_banner3_lkg9ts.jpg",
      "Interior" => "https://res.cloudinary.com/dzpgbbhmm/image/upload/v1606483237/impact/interior_banner_jxlxr6.jpg",
    }
    
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
