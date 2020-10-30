require 'rails_helper'

describe 'ShopsController#search', :type => :request do

  context 'without search terms' do
    let!(:shops) { FactoryBot.create_list(:shop, 100) }
    # WITHOUT PAGINATION
    context 'without page parameters' do
      before { get '/shop/search' }
      # Test Header
      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
      # Test Body
      it 'returns all shops' do
        expect(JSON.parse(response.body).size).to eq(100)
      end
    end
    # WITH PAGINATION
    context 'with page parameters' do
      before { get '/shop/search', params: { page: 1 } }
      # Test Header
      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
      # Test Body
      it 'returns shops on page 1' do
        expect(JSON.parse(response.body).size).to eq(25)
      end
    end
  end

  context 'with search terms' do
    let!(:shops) { [
      FactoryBot.create_list(:shop, 100),
      FactoryBot.create(:shop, name: 'Name_Test A', industry: 'Kind_Test A', logo_url: 'test_logo_url', slogan: 'test_slogan'),
      FactoryBot.create(:shop, name: 'Name_Test B', industry: 'Kind_Test A', logo_url: 'test_logo_url', slogan: 'test_slogan'),
      FactoryBot.create(:shop, name: 'Name_Test C', industry: 'Kind_Test B', logo_url: 'test_logo_url', slogan: 'test_slogan'),
      FactoryBot.create(:shop, name: 'Name_Test D', industry: 'Kind_Test B', logo_url: 'test_logo_url', slogan: 'test_slogan'),
    ] }

    context 'with name search terms' do
      # WITHOUT PAGINATION
      context 'without page parameters' do
        before { get '/shop/search', params: { name: 'name_test' } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns all shops' do
          expect(JSON.parse(response.body).size).to eq(4)
        end
      end
      # WITH PAGINATION
      context 'with page parameters' do
        before { get '/shop/search', params: { name: 'name_test', page: 1 } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns shops on page 1' do
          expect(JSON.parse(response.body).size).to eq(4)
        end
      end
    end

    context 'with kind search terms' do
      # WITHOUT PAGINATION
      context 'without page parameters' do
        before { get '/shop/search', params: { kind: 'kind_test' } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns all shops' do
          expect(JSON.parse(response.body).size).to eq(4)
        end
      end
      # WITH PAGINATION
      context 'with page parameters' do
        before { get '/shop/search', params: { kind: 'kind_test', page: 1 } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns shops on page 1' do
          expect(JSON.parse(response.body).size).to eq(4)
        end
      end
    end

    context 'with name and kind search terms' do
      # WITHOUT PAGINATION
      context 'without page parameters' do
        before { get '/shop/search', params: { name: 'name_test', kind: 'kind_test a' } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns all shops' do
          expect(JSON.parse(response.body).size).to eq(2)
        end
      end
      # WITH PAGINATION
      context 'with page parameters' do
        before { get '/shop/search', params: { name: 'name_test', kind: 'kind_test a', page: 1 } }
        # Test Header
        it 'returns status code 200' do
          expect(response).to have_http_status(:success)
        end
        # Test Body
        it 'returns shops on page 1' do
          expect(JSON.parse(response.body).size).to eq(2)
        end
      end
    end
  end
end