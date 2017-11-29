require 'rails_helper'

RSpec.describe 'Positions' do

  describe 'GET /positions' do
    before { get '/positions' }

    specify { expect(response).to have_http_status(:ok) }
  end

  describe 'GET /positions/new' do
    before { get '/positions/new' }

    specify { expect(response).to have_http_status(:ok) }
  end

  describe 'POST /positions' do
    let(:valid_params) do
      {
        employer: 'The Moon',
        location: 'Lunar Sea',
        source:   'Fry',
        status:   'in_progress',
        title:    'Whaler',
        url:      'http://lunar.gov'
      }
    end

    it 'should redirect to position when params are valid' do
      post('/positions', params: { position: valid_params })

      expect(response).to       have_http_status(:redirect)
      expect(Position.count).to eq(1)
    end

    it 'should re-render the template when params are invalid' do
      post('/positions', params: { position: { url: 1 } })

      expect(response).to       have_http_status(:ok)
      expect(Position.count).to eq(0)
    end
  end

  describe 'GET /positions/:id' do
    before do
      get "/positions/#{FactoryBot.create(:position).id}"
    end

    specify { expect(response).to have_http_status(:ok) }
  end
end