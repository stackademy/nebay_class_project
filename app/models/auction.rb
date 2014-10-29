class Auction < ActiveRecord::Base
  has_many :bids
  belongs_to :user
  mount_uploader :picture , AuctionImageUploader 

	 def highest_bid
	    self.bids.order(amount: :desc).first
	 end


	def active?
		 Time.now < end_date 
	end

end
