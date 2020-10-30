require 'rails_helper'

describe 'RestaurantsController#index', :type => :request do
  let!(:restaurants) { FactoryBot.create_list(:restaurant, 100) }

  # WITHOUT PAGINATION
  context 'without page parameters' do
    before { get '/restaurants' }

    # Test Header
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    # Test Body
    it 'returns all restaurants' do
      expect(JSON.parse(response.body).size).to eq(100)
    end
  end

  # WITH PAGINATION
  context 'with page parameters' do
    before { get '/restaurants', params: { page: 1 } }

    # Test Header
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    # Test Body
    it 'returns restaurants on page 1' do
      expect(JSON.parse(response.body).size).to eq(25)
    end
  end

end