json.array!(@auctions) do |auction|
  json.extract! auction, :id, :title, :description, :end_date, :user_id
  json.url auction_url(auction, format: :json)
end
