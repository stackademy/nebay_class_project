require 'rails_helper'


describe AuctionsController do
  describe "show" do
    it "should not explode when we render it" do
      auction = FactoryGirl.create(:auction)

      get :show, id: auction.id

      expect(response).to render_template("show")
      expect(assigns[:auction]).to eql(auction)
    end

  end

  describe "create" do
    it "should assign the logged in user to auctions" do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, auction: { title: "woo", description: "hoo", category: "shoes"}
      
      expect(assigns[:auction].title).to eql("woo")
      expect(assigns[:auction].user).to  eql(user)
    end
  end

  describe "search" do
    it "should return only the auctions matching the search term" do
      auction1 = FactoryGirl.create(:auction, title: "hello")
      auction = FactoryGirl.create(:auction, title: "Bye")

      post :search, search_term:  "hello" 
      expect(assigns[:auctions].first).to eql(auction1) 
      expect(assigns[:auctions].count).to eql(1) 
    end



  end


end