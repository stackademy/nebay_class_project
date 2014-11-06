require 'rails_helper'

describe 'auctions/show' do
  it 'should show the days remaining' do
    auction = FactoryGirl.build_stubbed(:auction, end_date: 5.days.from_now)
    assign :auction, auction

    render template: 'auctions/show'
    expect(rendered).to match('This auction expires 5 days from now')
  end
end