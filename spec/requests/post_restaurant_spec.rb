require 'rails_helper'

describe 'Restaurant#create', type: :request do

  before { post '/restaurants', params: { name: 'test_name', kind: 'test_kind', description: 'test_description', review: 'test_review' } }

  # Test Header
  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

  # Test Body
  it 'returns correct content' do
    expect(JSON.parse(response.body)['name']).to eq('test_name')
    expect(JSON.parse(response.body)['kind']).to eq('test_kind')
    expect(JSON.parse(response.body)['description']).to eq('test_description')
    expect(JSON.parse(response.body)['review']).to eq('test_review')
  end

end