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

  it 'returns a new Varejonline::API::Receivables' do
    expect(Varejonline.new('abc').receivables.class).to eq(Varejonline::API::Receivables)
  end

  it 'returns a new Varejonline::API::Payables' do
    expect(Varejonline.new('abc').payables.class).to eq(Varejonline::API::Payables)
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

  it 'returns a new Varejonline::API::Products' do
    expect(Varejonline.new('abc').products.class).to eq(Varejonline::API::Products)
  end

  it 'returns a new Varejonline::API::CategoryLevels' do
    expect(Varejonline.new('abc').category_levels.class).to eq(Varejonline::API::CategoryLevels)
  end

  it 'returns a new Varejonline::API::ProductCategories' do
    expect(Varejonline.new('abc').product_categories.class).to eq(Varejonline::API::ProductCategories)
  end

  it 'returns a new Varejonline::API::PaymentConditions' do
    expect(Varejonline.new('abc').payment_conditions.class).to eq(Varejonline::API::PaymentConditions)
  end

  it 'returns a new Varejonline::API::Payments' do
    expect(Varejonline.new('abc').payments.class).to eq(Varejonline::API::Payments)
  end

  it 'returns a new Varejonline::API::CardNegotiations' do
    expect(Varejonline.new('abc').card_negotiations.class).to eq(Varejonline::API::CardNegotiations)
  end
end