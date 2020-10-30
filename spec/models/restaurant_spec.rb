require 'rails_helper'

describe Restaurant do 
  it { should validate_presence_of :name }
  it { should validate_presence_of :kind }
  it { should validate_presence_of :description }
  it { should validate_presence_of :review }

  it 'titleizes the name and kind of restaurant' do
    restaurant = FactoryBot.create(:restaurant, name: 'test name', kind: 'test kind')
    expect(restaurant.name).to eq('Test Name')
    expect(restaurant.kind).to eq('Test Kind')
  end

  it 'capitalizes the description and review of restaurant' do
    restaurant = FactoryBot.create(:restaurant, description: 'test description', review: 'test review')
    expect(restaurant.description).to eq('Test description')
    expect(restaurant.review).to eq('Test review')
  end
end