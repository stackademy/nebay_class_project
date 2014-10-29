class UserMailer < ActionMailer::Base
  default from: "auctionEnded@nebay.com"


def auctionEnded(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'The auction you was susbscribed to has ended!')
  end


  def payment_confirmation(email, shipping_address)
  	@shipping_address = shipping_address
  	mail(to: email, subject: "Your object has been paid for")
  end

end
