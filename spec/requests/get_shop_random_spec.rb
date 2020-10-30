require 'rails_helper'

describe 'ShopsController#random', :type => :request do
  let!(:shops) { FactoryBot.create_list(:shop, 20) }
  before { get '/shop/random' }
  # Test Header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
  # Test Body
  it 'returns single shop object with 7 properties' do
    expect(JSON.parse(response.body).size).to eq(7)
    expect(JSON.parse(response.body)).to have_key('id')
    expect(JSON.parse(response.body)['name']).to be_instance_of(String)
    expect(JSON.parse(response.body)['industry']).to be_instance_of(String)
    expect(JSON.parse(response.body)['logo_url']).to be_instance_of(String)
    expect(JSON.parse(response.body)['slogan']).to be_instance_of(String)
    expect(JSON.parse(response.body)['created_at']).to be_instance_of(String)
    expect(JSON.parse(response.body)['updated_at']).to be_instance_of(String)
  end
end