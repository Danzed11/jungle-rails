class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @sorted = Review.all.order(created_at: :desc).where(product_id: params[:id]).joins(:user)

  end

end
