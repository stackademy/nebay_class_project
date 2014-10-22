namespace :accounting do

  task :update_from_all_sources do
    Auction.all.each do |auction|
      puts auction.title
    end
  end

end
