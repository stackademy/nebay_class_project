class Category
  
 def self.all
 	 Auction.uniq.pluck(:category)
 	
 end
 	



end
