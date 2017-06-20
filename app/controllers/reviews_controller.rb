class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # POST /reviews
  # POST /reviews.json
  def create

    @product = Product.find( params[:product_id])
    @product.reviews.create(review_params)
    @product.save

    if current_user.try(:admin?)
      redirect_to product_path(@product)
    else
      redirect_to store_show_path(@product)
    end

    @review = Review.new(review_params)

  end


  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy

    @product = Product.find(params[:product_id])
    @revoew = @product.reviews.find(params[:id])
    @review.destroy

    redirect_to product_path(@product)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :comment, :rating, :product_id)
    end
end
