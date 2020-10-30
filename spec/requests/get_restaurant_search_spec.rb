require 'rails_helper'

describe 'Restaurants#search', :type => :request do

  context 'without search terms' do
    let!(:restaurants) { FactoryBot.create_list(:restaurant, 100) }
    # WITHOUT PAGINATION
    context 'without page parameters' do
      before { get '/restaurant/search' }
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
      before { get '/restaurant/search', params: { page: 1 } }
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

  context 'with search terms' do
    let!(:restaurants) { [
      FactoryBot.create_list(:restaurant, 100),
      FactoryBot.create(:restaurant, name: 'Name_Test A', kind: 'Kind_Test A', description: 'test_description', review: 'test_review'),
      FactoryBot.create(:restaurant, name: 'Name_Test B', kind: 'Kind_Test A', description: 'test_description', review: 'test_review'),
      FactoryBot.create(:restaurant, name: 'Name_Test C', kind: 'Kind_Test B', description: 'test_description', review: 'test_review'),
      FactoryBot.create(:restaurant, name: 'Name_Test D', kind: 'Kind_Test B', description: 'test_description', review: 'test_review'),
    ] }

    context 'with name search terms' do
      # WITHOUT PAGINATION
      context 'without page parameters' do
        before { get '/restaurant/search', params: { name: 'name_test' } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns all restaurants' do
          expect(JSON.parse(response.body).size).to eq(4)
        end
      end
      # WITH PAGINATION
      context 'with page parameters' do
        before { get '/restaurant/search', params: { name: 'name_test', page: 1 } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns restaurants on page 1' do
          expect(JSON.parse(response.body).size).to eq(4)
        end
      end
    end

    context 'with kind search terms' do
      # WITHOUT PAGINATION
      context 'without page parameters' do
        before { get '/restaurant/search', params: { kind: 'kind_test' } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns all restaurants' do
          expect(JSON.parse(response.body).size).to eq(4)
        end
      end
      # WITH PAGINATION
      context 'with page parameters' do
        before { get '/restaurant/search', params: { kind: 'kind_test', page: 1 } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns restaurants on page 1' do
          expect(JSON.parse(response.body).size).to eq(4)
        end
      end
    end

    context 'with name and kind search terms' do
      # WITHOUT PAGINATION
      context 'without page parameters' do
        before { get '/restaurant/search', params: { name: 'name_test', kind: 'kind_test a' } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns all restaurants' do
          expect(JSON.parse(response.body).size).to eq(2)
        end
      end
      # WITH PAGINATION
      context 'with page parameters' do
        before { get '/restaurant/search', params: { name: 'name_test', kind: 'kind_test a', page: 1 } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns restaurants on page 1' do
          expect(JSON.parse(response.body).size).to eq(2)
        end
      end
    end
  end
end