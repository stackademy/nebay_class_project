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


end