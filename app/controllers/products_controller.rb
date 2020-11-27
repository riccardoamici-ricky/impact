class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def buy
    current_user.karma_points -= 10
    current_user.save
  end

end
