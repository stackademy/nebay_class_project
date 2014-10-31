class PagesController < ApplicationController
  
  def home
    @categories = Category.all
    @auctions = Auction.all
  end

  def about
  end

  def imprint
  end

  
end
