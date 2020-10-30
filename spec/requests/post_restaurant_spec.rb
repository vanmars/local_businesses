require 'rails_helper'

describe 'RestaurantsController#create', type: :request do

  context 'with successful call' do
    before { post '/restaurants', params: { name: 'test name', kind: 'test kind', description: 'test description', review: 'test review' } }
    # Test Header
    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
    # Test Body
    it 'returns correct content' do
      expect(JSON.parse(response.body)['name']).to eq('Test Name')
      expect(JSON.parse(response.body)['kind']).to eq('Test Kind')
      expect(JSON.parse(response.body)['description']).to eq('test description')
      expect(JSON.parse(response.body)['review']).to eq('test review')
    end
  end

  context 'with unsuccessful call due to parameter validations failure' do
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
end