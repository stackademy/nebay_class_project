require 'rails_helper'

describe Bid, "#amount_in_cents" do
  
  it "returns the amount times 100" do
    bid = Bid.new(amount: 20)
    expect(bid.amount_in_cents).to eq(2000)
  end

end