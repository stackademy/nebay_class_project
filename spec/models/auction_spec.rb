require 'rails_helper'

describe Auction do
  
  describe "validations" do

    before(:each) do
      @auction = Auction.new(title: "woo", description: "hoo", category: "shoes")
    end

    it "should not be valid without a title" do
      @auction.title = ""
      expect(@auction.valid?).to be false
    end

    it "should not be valid without a description" do
      @auction.description = ""
      expect(@auction.valid?).to be false
    end

    it "should be valid with a title, description and category" do
      expect(@auction.valid?).to be true
    end

  end


describe "highest bidder" do
  before(:each) do
      @auction = FactoryGirl.create(:auction)
    end


  it "should return the highest bid if there is more than one bid" do

    Bid.create(amount: 190, auction: @auction)
    Bid.create(amount: 195, auction: @auction)
    Bid.create(amount: 185, auction: @auction)

    expect(@auction.highest_bid.amount).to be 195
  end

  it "should return nil if there are no bids" do

    expect(@auction.highest_bid).to be nil
  end


  it "if there is only one bid it will return that bid" 
  it "should pick the first created if there are two equal bids"
end

end