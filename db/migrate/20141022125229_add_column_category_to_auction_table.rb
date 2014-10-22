class AddColumnCategoryToAuctionTable < ActiveRecord::Migration
  def change
    add_column :auctions, :category, :string
  end
end
