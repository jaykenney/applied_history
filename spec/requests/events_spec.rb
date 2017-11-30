require 'rails_helper'

RSpec.describe 'Position Events' do
  let(:position) { FactoryBot.create(:position, user: current_user) }

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

  describe 'PATCH /positions/:position_id/events/:id' do
    let(:event) { FactoryBot.create(:event, position: position) }

    it 'should redirect to position when params are valid' do
      patch("/positions/#{position.id}/events/#{event.id}",
        params: { event: { description: 'E' }})

      expect(response).to have_http_status(:redirect)

      expect(position.events.where(description: 'E').count).to eq(1)
    end

    it 'should re-render the template when params are invalid' do
      patch("/positions/#{position.id}/events/#{event.id}",
        params: { event: { description: '' }})

      expect(response).to have_http_status(:ok)

      expect(position.events.where(description: '').count).to eq(0)
    end
  end

  describe 'DELETE /positions/:position_id/events/:id' do
    let(:event) { FactoryBot.create(:event, position: position) }

    it 'should delete then redirect to the position' do
      delete("/positions/#{position.id}/events/#{event.id}")

      expect(response).to     have_http_status(:redirect)
      expect(Event.count).to  eq(0)
    end
  end
end
