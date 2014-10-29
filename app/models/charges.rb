class Auction < ActiveRecord::Base

	validates :name, :address, :city, :postcode, :country, presence: true

end