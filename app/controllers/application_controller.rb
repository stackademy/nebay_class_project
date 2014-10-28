class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_categories
  def set_categories
  	@categories = Auction.uniq.pluck(:category)
  end
end

