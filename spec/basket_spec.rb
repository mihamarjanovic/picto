require 'rspec'
require_relative '../lib/basket'
require_relative '../lib/catalogue'
require_relative '../lib/delivery_rule'
require_relative '../lib/offer'

RSpec.describe Basket do
  let(:catalogue) { Catalogue.new }
  let(:delivery_rule) { DeliveryRule.new }
  let(:offer) { Offer.new(catalogue) }
  let(:basket) { Basket.new(catalogue, delivery_rule, offer) }

  it 'calculates total for B01, G01 as $37.85' do
    basket.add('B01')
    basket.add('G01')

    expect(basket.total).to eq(37.85)
  end

  it 'calculates total for R01, R01 as $54.38' do
    basket.add('R01')
    basket.add('R01')
    
    expect(basket.total).to eq(54.38)
  end

  it 'calculates total for R01, G01 as $60.85' do
    basket.add('R01')
    basket.add('G01')

    expect(basket.total).to eq(60.85)
  end

  it 'calculates total for B01, B01, R01, R01, R01 as $98.28' do
    basket.add('B01')
    basket.add('B01')
    basket.add('R01')
    basket.add('R01')
    basket.add('R01')

    expect(basket.total).to eq(98.28)
  end

  it 'raises error for invalid product code' do
    expect { basket.add('X01') }.to raise_error('Invalid product code')
  end
end