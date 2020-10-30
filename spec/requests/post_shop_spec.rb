require 'rails_helper'

#################
# SUCCESSFUL CALL
#################
describe 'Shop#create', type: :request do

  before { post '/shops', params: { name: 'test_name', industry: 'test_industry', logo_url: 'test_logo_url', slogan: 'test_slogan' } }

  # Test Header
  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

  # Test Body
  it 'returns correct content' do
    expect(JSON.parse(response.body)['name']).to eq('test_name')
    expect(JSON.parse(response.body)['industry']).to eq('test_industry')
    expect(JSON.parse(response.body)['logo_url']).to eq('test_logo_url')
    expect(JSON.parse(response.body)['slogan']).to eq('test_slogan')
  end

end

################################################
# UNSUCCESSFUL CALL - Parameter Validations Fail
################################################
describe 'Shop#create', type: :request do

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