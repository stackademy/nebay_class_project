class UserAuctionEnded < ActionMailer::Base
  default from: "auctionEnded@nebay.com"


def auctionEnded(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'The auction you was susbscribed to has ended!')
  end


end
