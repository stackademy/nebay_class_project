class ChargesController < ApplicationController
	skip_before_action :verify_authenticity_token


def index
	redirect_to pages_home_path
end

def send_emails
	shipping_address = params
	mail = BidderMailer.bidder_payment_confirmation(current_user.email, shipping_address)
    mail.deliver
    auction_id = params[:auction_id]
	@auction = Auction.find(auction_id)
    @user =	@auction.user
    mail = UserMailer.payment_confirmation(@user.email, shipping_address)
    mail.deliver
    redirect_to pages_home_path
end


def new
end

def create
  # Amount in cents
  auction_id = params[:auction_id]
  @auction = Auction.find(auction_id)
  @amount = @auction.highest_bid.amount_in_cents

  customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'eur'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end

private

	def shipping_address_params
	  params.require(:auction_id).permit(:name, :address, :city, :state, :country)
	end
