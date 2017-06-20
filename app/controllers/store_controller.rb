class StoreController < ApplicationController
  #before_action :set_product, only: [:show]

  #not sure if useful but whatever
  #before_action :authenticate_user!, except: [:index, :show]

  def index

    @products = Product.order(price: :desc).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end


  #private
#
  #  def set_product
  #    @product = Product.find(params[:id])
  #  end
#
  #  def product_params
  #    params.require(:product).permit(:name, :description, :qty_on_hand, :price, :cost, :shipping_weight, :thumbnail, :full_size)
  #  end


end
