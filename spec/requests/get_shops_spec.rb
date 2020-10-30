require 'rails_helper'

describe 'ShopsController#index', :type => :request do
  let!(:shops) { FactoryBot.create_list(:shop, 100) }

  # WITHOUT PAGINATION
  context 'without page parameters' do
    before { get '/shops' }
    # Test Heeader
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
    # Test Body
    it 'returns all shops' do
      expect(JSON.parse(response.body).size).to eq(100)
    end
  end

  # WITH PAGINATION
  context 'wit page parameters' do
    before { get '/shops', params: { page: 1 } }
    # Test Heeader
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
    # Test Body
    it 'returns restaurants on page 1' do
      expect(JSON.parse(response.body).size).to eq(25)
    end
  end
end