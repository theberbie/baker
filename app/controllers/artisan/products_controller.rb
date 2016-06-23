class Artisan::ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.create(product_params)
    redirect_to artisan_product_path(@product)
  end

  def show
    @product = Product.find(params[:id])
  end

  private 

  def product_params
    params.require(:product).permit(:name, :description, :category, :cost)
    
  end
end
