require 'rails_helper'

describe 'ShopsController#update', :type => :request do
  let!(:shops) { 
    [
      FactoryBot.create_list(:shop, 19),
      FactoryBot.create(:shop, name: 'test_name', industry: 'test_industry', logo_url: 'test_logo_url', slogan: 'test_slogan', id: 20)
    ]
  }

  before { put '/shops/20', params: {name: 'patched_test_name'} }

  # Test Header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test Body
  it 'returns success message' do
    expect(JSON.parse(response.body)['message']).to eq("Shop successfully updated.")
  end

end