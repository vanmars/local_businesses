require 'rails_helper'

describe 'RestaurantsController#update', :type => :request do
  let!(:restaurants) { 
    [
      FactoryBot.create_list(:restaurant, 19),
      FactoryBot.create(:restaurant, name: 'test_name', kind: 'test_kind', description: 'test_description', review: 'test_review', id: 20)
    ]
  }

  before { put '/restaurants/20', params: {name: 'patched_test_name'} }

  # Test Header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test Body
  it 'returns success message' do
    expect(JSON.parse(response.body)['message']).to eq("Restaurant successfully updated.")
  end

end