class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.datetime :end_date
      t.integer :user_id

      t.timestamps
    end
  end
end
