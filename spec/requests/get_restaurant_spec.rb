require 'rails_helper'

describe 'RestaurantsController#show', :type => :request do

  context 'with successful call' do
    let!(:restaurants) { 
      [
        FactoryBot.create_list(:restaurant, 19),
        FactoryBot.create(:restaurant, name: 'test name', kind: 'test kind', description: 'test description', review: 'test review', id: 20)
      ]
    }
    before { get '/restaurants/20' }
    # Test Header
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
    # Test Body
    it 'returns correct data' do
      expect(JSON.parse(response.body)['name']).to eq('Test Name')
      expect(JSON.parse(response.body)['kind']).to eq('Test Kind')
      expect(JSON.parse(response.body)['description']).to eq('Test description')
      expect(JSON.parse(response.body)['review']).to eq('Test review')
    end
  end

  context 'with unsuccessful call due to invalid id' do
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
end