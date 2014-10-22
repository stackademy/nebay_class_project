class Auction < ActiveRecord::Base
  has_many :bids
  belongs_to :user

  def highest_bid
    self.bids.order(amount: :desc).first
  end
end
