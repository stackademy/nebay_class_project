class CategoriesController < ApplicationController
  

  def index
    @categories = Auction.uniq.pluck(:category)
  end


  def show
    @category = params[:id]
    # find(params[:id])

    @auctions = Auction.where(category: @category)
    render 'auctions/index'
  end

end
