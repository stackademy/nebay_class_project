module AuctionsHelper

  def print_highest_bid(auction)
    auction.bids.order(amount: :desc).first
  end

  def auctions_for_category(category)
  	Auction.where(category: category)
  	
  end

end
