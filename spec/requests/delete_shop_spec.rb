require 'rails_helper'

describe 'ShopsController#destroy', :type => :request do
  let!(:shops) { 
    [
      FactoryBot.create_list(:shop, 19),
      FactoryBot.create(:shop, name: 'test_name', industry: 'test_industry', logo_url: 'test_logo_url', slogan: 'test_slogan', id: 1)
    ]
  }
  before do
     delete '/shops/1'
  end
  # Test Header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
  # Test Body
  it 'returns successful delete message' do
    expect(JSON.parse(response.body)['message']).to eq("Shop successfully deleted.")
  end
end