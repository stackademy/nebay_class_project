class BidderMailer < ActionMailer::Base
  default from: "admin@nebay.com"

    def new_bidder_alert(email, subject)
      mail(to: email, subject: subject)
    end
  	
  	def bidder_payment_confirmation(email, shipping_address)
  		@shipping_address = shipping_address
  		mail(to: email, subject: "Thank you for your payment")
  	end

end
