class CategoriesController < ApplicationController
  def index
    @images = {
      "Fashion" => "https://res.cloudinary.com/dzpgbbhmm/image/upload/v1606483237/impact/fashion_banner_lhl4gk.jpg",
      "Plants" => "https://res.cloudinary.com/dzpgbbhmm/image/upload/v1606483237/impact/plants_banner_hlhohn.jpg",
      "Food" => "https://res.cloudinary.com/dzpgbbhmm/image/upload/v1606486385/impact/food_banner3_lkg9ts.jpg",
      "Interior" => "https://res.cloudinary.com/dzpgbbhmm/image/upload/v1606483237/impact/interior_banner_jxlxr6.jpg",
    }

      @categories = Category.all
      @categories = Category.where("name ILIKE ?", "%#{params[:query]}%") if params[:query].present?
  end

  def show
    @category = Category.find(params[:id])

    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
      @products = Product.where(category: @category)
    end
  end
end
