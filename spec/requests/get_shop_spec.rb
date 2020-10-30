require 'rails_helper'

#################
# SUCCESSFUL CALL
#################
describe 'Shop#show', :type => :request do

  let!(:shops) { 
    [
      FactoryBot.create_list(:shop, 19),
      FactoryBot.create(:shop, name: 'test_name', industry: 'test_industry', logo_url: 'test_logo_url', slogan: 'test_slogan', id: 20)
    ]
  }

  before { get '/shops/20' }
    
  # Test Header
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  # Test Body
  it 'returns correct data' do
    expect(JSON.parse(response.body)['name']).to eq('test_name')
    expect(JSON.parse(response.body)['industry']).to eq('test_industry')
    expect(JSON.parse(response.body)['logo_url']).to eq('test_logo_url')
    expect(JSON.parse(response.body)['slogan']).to eq('test_slogan')
  end
end

################################
# UNSUCCESSFUL CALL - Invalid ID
################################
describe 'Shop#show', :type => :request do

  let!(:shops) { FactoryBot.create_list(:shop, 20) }

  before { get '/shops/100' }
    
  # Test Header
  it 'returns status code 200' do
    expect(response).to have_http_status(:not_found)
  end

  # Test Body
  it 'returns correct data' do
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find Shop with 'id'=100")
  end

end