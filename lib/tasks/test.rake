require 'rake'
namespace :auctions do

  desc "print auctions summary"
  task :summary => :environment do
    Auction.all.each do |auction|
      puts auction.title
    end
  end

end
