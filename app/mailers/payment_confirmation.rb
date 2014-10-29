class PaymentConfirmation < ActionMailer::Base
  default from: "admin@nebay.com"
  
  def confirmation(email)
  	mail(to: email, subject: "Thank you for your payment")
  end