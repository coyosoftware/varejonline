require 'spec_helper'

RSpec.describe Varejonline::Client do
  it 'returns a new Varejonline::API::ThirdParties' do
    expect(Varejonline.new('abc').third_parties.class).to eq(Varejonline::API::ThirdParties)
  end
  
  it 'returns a new Varejonline::API::Entities' do
    expect(Varejonline.new('abc').entities.class).to eq(Varejonline::API::Entities)
  end
  
  it 'returns a new Varejonline::API::DefaultEntries' do
    expect(Varejonline.new('abc').default_entries.class).to eq(Varejonline::API::DefaultEntries)
  end
  
  it 'returns a new Varejonline::API::Provisions' do
    expect(Varejonline.new('abc').provisions.class).to eq(Varejonline::API::Provisions)
  end
  
  it 'returns a new Varejonline::API::UserData' do
    expect(Varejonline.new('abc').user_data.class).to eq(Varejonline::API::UserData)
  end
  
  it 'returns a new Varejonline::API::Installments' do
    expect(Varejonline.new('abc').installments.class).to eq(Varejonline::API::Installments)
  end

  it 'returns a new Varejonline::API::CreditLimits' do
    expect(Varejonline.new('abc').credit_limits.class).to eq(Varejonline::API::CreditLimits)
  end

  it 'returns a new Varejonline::API::ClientClasses' do
    expect(Varejonline.new('abc').client_classes.class).to eq(Varejonline::API::ClientClasses)
  end

  it 'returns a new Varejonline::API::SalesHistory' do
    expect(Varejonline.new('abc').sales_history.class).to eq(Varejonline::API::SalesHistory)
  end

  it 'returns a new Varejonline::API::Orders' do
    expect(Varejonline.new('abc').orders.class).to eq(Varejonline::API::Orders)
  end

  it 'returns a new Varejonline::API::Companies' do
    expect(Varejonline.new('abc').companies.class).to eq(Varejonline::API::Companies)
  end

  it 'returns a new Varejonline::API::Sellers' do
    expect(Varejonline.new('abc').sellers.class).to eq(Varejonline::API::Sellers)
  end
end