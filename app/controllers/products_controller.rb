class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.products
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product item added successfully.'
    else
      render :new
    end
  end

  def show
    delete
  end

  private

  def product_params
    params.require(:product).permit(:name, :measurement_unit, :price, :quantity)
  end

  def delete
    @product = current_user.products.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: 'Product item deleted successfully'
  end
end
