require 'rails_helper'

describe 'RestaurantsController#destroy', :type => :request do
  let!(:restaurants) { 
    [
      FactoryBot.create_list(:restaurant, 19),
      FactoryBot.create(:restaurant, name: 'test_name', kind: 'test_kind', description: 'test_description', review: 'test_review', id: 20)
    ]
  }
  before do
     delete '/restaurants/20'
  end
  # Test Header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
  # Test Body
  it 'returns successful delete message' do
    expect(JSON.parse(response.body)['message']).to eq("Restaurant successfully deleted.")
  end
end