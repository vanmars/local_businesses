require 'rails_helper'

describe 'Shop#index', :type => :request do
  let!(:shops) { FactoryBot.create_list(:shop, 20) }

  before { get '/shops' }

  # Test Heeader
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test Body
  it 'returns all shops' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
end