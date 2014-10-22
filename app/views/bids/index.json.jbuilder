json.array!(@bids) do |bid|
  json.extract! bid, :id, :amount, :user_id, :auction_id
  json.url bid_url(bid, format: :json)
end
