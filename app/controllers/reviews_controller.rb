class ReviewsController < ApplicationController

  def create
    @offer = Offer.find(params[:offer_id])
    @review = Review.new(review_params)
    @review.offer = @offer
    if @review.save
      redirect_to offer_path(@offer, anchor: "review-#{@review.id}")
    else
      render "offers/show"
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:content)
  end
end
