class Auction < ActiveRecord::Base
  has_many :bids
  belongs_to :user
  mount_uploader :picture , AuctionImageUploader
  validates_presence_of :title, :message => "can't be empty"
  validates_presence_of :description, :message => "can't be empty"
  validates_presence_of :category, :message => "can't be empty"
  #validates_presence_of :picture, :message => "can't be empty"




	 def highest_bid
	    self.bids.order(amount: :desc).first
	 end


	def active?
		 Time.now < end_date 
	end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end
