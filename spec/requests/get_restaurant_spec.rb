require 'rails_helper'

#################
# SUCCESSFUL CALL
#################
describe 'RestaurantsController#show', :type => :request do

  let!(:restaurants) { 
    [
      FactoryBot.create_list(:restaurant, 19),
      FactoryBot.create(:restaurant, name: 'test_name', kind: 'test_kind', description: 'test_description', review: 'test_review', id: 20)
    ]
  }

  before { get '/restaurants/20' }
    
  # Test Header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test Body
  it 'returns correct data' do
    expect(JSON.parse(response.body)['name']).to eq('test_name')
    expect(JSON.parse(response.body)['kind']).to eq('test_kind')
    expect(JSON.parse(response.body)['description']).to eq('test_description')
    expect(JSON.parse(response.body)['review']).to eq('test_review')
  end
end

################################
# UNSUCCESSFUL CALL - Invalid ID
################################
describe 'RestaurantsController#show', :type => :request do

  let!(:restaurants) { FactoryBot.create_list(:restaurant, 20) }

  before { get '/restaurants/100' }
    
  # Test Header
  it 'returns status code 404' do
    expect(response).to have_http_status(:not_found)
  end

  # Test Body
  it 'returns correct error message' do
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find Restaurant with 'id'=100")
  end

end