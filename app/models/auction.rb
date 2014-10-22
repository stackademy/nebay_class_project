class Auction < ActiveRecord::Base
  has_many :bids

  def highest_bid
    self.bids.order(amount: :desc).first
  end
end
