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
end