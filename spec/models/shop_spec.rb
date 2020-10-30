require 'rails_helper'

describe Shop do 
  it { should validate_presence_of :name }
  it { should validate_presence_of :industry }
  it { should validate_presence_of :logo_url }
  it { should validate_presence_of :slogan }

  it 'titleizes the name and industry of a shop' do
    shop = FactoryBot.create(:shop, name: 'test name', industry: 'test industry')
    expect(shop.name).to eq('Test Name')
    expect(shop.industry).to eq('Test Industry')
  end

  it 'capitalizes the slogan of a shop' do
    shop = FactoryBot.create(:shop, slogan: 'test slogan')
    expect(shop.slogan).to eq('Test slogan')
  end
end