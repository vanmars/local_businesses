require 'rails_helper'

#################
# SUCCESSFUL CALL
#################
describe 'RestaurantsController#create', type: :request do

  before { post '/restaurants', params: { name: 'test_name', kind: 'test_kind', description: 'test_description', review: 'test_review' } }

  # Test Header
  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

  # Test Body
  it 'returns correct content' do
    expect(JSON.parse(response.body)['name']).to eq('test_name')
    expect(JSON.parse(response.body)['kind']).to eq('test_kind')
    expect(JSON.parse(response.body)['description']).to eq('test_description')
    expect(JSON.parse(response.body)['review']).to eq('test_review')
  end

end

################################################
# UNSUCCESSFUL CALL - Parameter Validations Fail
################################################
describe 'RestaurantsController#create', type: :request do

  before { post '/restaurants', params: { name: 'test_name'} }

  # Test Header
  it 'returns a 422 status' do
    expect(response).to have_http_status(:unprocessable_entity)
  end

  # Test Body
  it 'returns correct error message' do
    expect(JSON.parse(response.body)['message']).to eq("Validation failed: Kind can't be blank, Description can't be blank, Review can't be blank")
  end

end