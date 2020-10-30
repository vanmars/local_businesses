require 'rails_helper'

describe 'RestaurantsController#random', :type => :request do
  let!(:restaurants) { FactoryBot.create_list(:restaurant, 20) }
  before { get '/restaurant/random' }
  # Test Header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
  # Test Body
  it 'returns single restaurant object with 7 properties' do
    expect(JSON.parse(response.body).size).to eq(7)
    expect(JSON.parse(response.body)).to have_key('id')
    expect(JSON.parse(response.body)['name']).to be_instance_of(String)
    expect(JSON.parse(response.body)['kind']).to be_instance_of(String)
    expect(JSON.parse(response.body)['description']).to be_instance_of(String)
    expect(JSON.parse(response.body)['review']).to be_instance_of(String)
    expect(JSON.parse(response.body)['created_at']).to be_instance_of(String)
    expect(JSON.parse(response.body)['updated_at']).to be_instance_of(String)
  end
end