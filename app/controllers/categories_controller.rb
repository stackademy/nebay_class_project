class CategoriesController < ApplicationController
  
  # makes us find the categories
  def index
    @categories = Auction.uniq.pluck(:category)
  end


  def show
    @category = params[:id]
    # find(params[:id])
    sort_order= params[:order]
    

    @auctions = Auction.where(category: @category).order(sort_order)
    render 'auctions/index'
  end

end
