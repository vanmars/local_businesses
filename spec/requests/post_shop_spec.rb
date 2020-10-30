require 'rails_helper'

describe 'ShopsController#create', type: :request do

  context 'with successful call' do
    before { post '/shops', params: { name: 'test name', industry: 'test industry', logo_url: 'test logo_url', slogan: 'test slogan' } }
    # Test Header
    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
    # Test Body
    it 'returns correct content' do
      expect(JSON.parse(response.body)['name']).to eq('Test Name')
      expect(JSON.parse(response.body)['industry']).to eq('Test Industry')
      expect(JSON.parse(response.body)['logo_url']).to eq('test logo_url')
      expect(JSON.parse(response.body)['slogan']).to eq('test slogan')
    end
  end

  context 'with unsuccessful call due to parameter validations fail' do
    before { post '/shops', params: { name: 'test_name'} }
    # Test Header
    it 'returns a 422 status' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
    # Test Body
    it 'returns correct error message' do
      expect(JSON.parse(response.body)['message']).to eq("Validation failed: Industry can't be blank, Logo url can't be blank, Slogan can't be blank")
    end
  end
end