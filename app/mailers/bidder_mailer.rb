class BidderMailer < ActionMailer::Base
  default from: "admin@nebay.com"

    def new_bidder_alert(email, subject)
      mail(to: email, subject: subject)
    end

end
