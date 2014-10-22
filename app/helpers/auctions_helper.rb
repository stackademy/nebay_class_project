module AuctionsHelper

  def print_highest_bid(auction)
    auction.bids.order(amount: :desc).first
  end

end
