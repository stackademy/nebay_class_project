class AddPictureColumnToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :picture, :string

  end
end
