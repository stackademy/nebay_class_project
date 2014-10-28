class AddPaidVerificationToAuctions < ActiveRecord::Migration
  def change
  	    add_column :auctions, :paid, :boolean, default:false
  end
end
