class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user

  def amount_in_cents
  	amount * 100
  end

end
