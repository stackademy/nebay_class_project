class ChargesController < ApplicationController

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
