class PagesController < ApplicationController
  
  def home
    @categories = Auction.uniq.pluck(:category)
  end

  def about
  end

  def imprint
  end
end
