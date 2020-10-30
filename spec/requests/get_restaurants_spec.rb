require 'rails_helper'

describe 'Restaurant#index', :type => :request do
  let!(:restaurants) { FactoryBot.create_list(:restaurant, 20) }

  before { get '/restaurants' }

  # Test Heeader
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test Body
  it 'returns all restaurants' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
end