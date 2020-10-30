require 'rails_helper'

describe Shop do 
  it { should validate_presence_of :name }
  it { should validate_presence_of :industry }
  it { should validate_presence_of :logo_url }
  it { should validate_presence_of :slogan }

  it 'titleizes the name and industry of a shop' do
    restaurant = FactoryBot.create(:shop, name: 'test name', industry: 'test industry')
    expect(restaurant.name).to eq('Test Name')
    expect(restaurant.industry).to eq('Test Industry')
  end
end