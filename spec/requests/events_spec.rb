require 'rails_helper'

RSpec.describe 'Position Events' do
  let(:position) { FactoryBot.create(:position) }

  describe 'GET /positions/:position_id/events/new' do
    before { get "/positions/#{position.id}/events/new" }

    specify { expect(response).to have_http_status(:ok) }
  end

  describe 'POST /positions/:position_id/events' do
    let(:valid_params) do
      {
        description: 'Submitted Resume',
        event_on:    '8/22/17'
      }
    end

    it 'should redirect to position when params are valid' do
      post("/positions/#{position.id}/events", params: { event: valid_params })

      expect(response).to               have_http_status(:redirect)
      expect(position.events.count).to  eq(1)
    end

    it 'should re-render the template when params are invalid' do
      post("/positions/#{position.id}/events", params: { event: { description: 1 } })

      expect(response).to               have_http_status(:ok)
      expect(position.events.count).to  eq(0)
    end
  end
end
