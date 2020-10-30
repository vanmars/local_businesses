require 'rails_helper'

describe 'ShopsController#show', :type => :request do

  context 'with successful call' do
    let!(:shops) { 
      [
        FactoryBot.create_list(:shop, 19),
        FactoryBot.create(:shop, name: 'test name', industry: 'test industry', logo_url: 'test logo_url', slogan: 'test slogan', id: 20)
      ]
    }
    before { get '/shops/20' }
    # Test Header
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
    # Test Body
    it 'returns correct data' do
      expect(JSON.parse(response.body)['name']).to eq('Test Name')
      expect(JSON.parse(response.body)['industry']).to eq('Test Industry')
      expect(JSON.parse(response.body)['logo_url']).to eq('test logo_url')
      expect(JSON.parse(response.body)['slogan']).to eq('test slogan')
    end
  end

  context 'with unsuccessful call due to invalid id' do
    let!(:shops) { FactoryBot.create_list(:shop, 20) }
    before { get '/shops/100' }
    # Test Header
    it 'returns status code 404' do
      expect(response).to have_http_status(:not_found)
    end
    # Test Body
    it 'returns correct error message' do
      expect(JSON.parse(response.body)['message']).to eq("Couldn't find Shop with 'id'=100")
    end
  end
end