require 'rails_helper'

RSpec.describe 'Position Contacts' do
  let(:position) { FactoryBot.create(:position, user: current_user) }

  describe 'GET /positions/:position_id/contacts' do
    before { get "/positions/#{position.id}/contacts" }

    specify { expect(response).to have_http_status(:ok) }
  end

  describe 'GET /positions/:position_id/contacts/new' do
    before { get "/positions/#{position.id}/contacts/new" }

    specify { expect(response).to have_http_status(:ok) }
  end

  describe 'POST /positions/:position_id/contacts' do
    let(:valid_params) do
      {
        name: 'Mr. Johnson'
      }
    end

    it 'should redirect to position when params are valid' do
      post("/positions/#{position.id}/contacts", params: { contact: valid_params })

      expect(response).to                 have_http_status(:redirect)
      expect(position.contacts.count).to  eq(1)
    end

    it 'should re-render the template when params are invalid' do
      post("/positions/#{position.id}/contacts", params: { contact: { phone: 1 } })

      expect(response).to                 have_http_status(:ok)
      expect(position.contacts.count).to  eq(0)
    end
  end

  describe 'PATCH /positions/:position_id/contacts/:id' do
    let(:contact) { FactoryBot.create(:contact, name: 'Mr Johnson', position: position) }

    it 'should redirect to position when params are valid' do
      patch("/positions/#{position.id}/contacts/#{contact.id}",
        params: { contact: { name: 'N' }})

      expect(response).to have_http_status(:redirect)

      expect(position.contacts.where(name: 'N').count).to eq(1)
    end

    it 'should re-render the template when params are invalid' do
      patch("/positions/#{position.id}/contacts/#{contact.id}",
        params: { contact: { name: '' }})

      expect(response).to have_http_status(:ok)

      expect(position.contacts.where(name: '').count).to eq(0)
    end
  end

  describe 'DELETE /positions/:position_id/contacts/:id' do
    let(:contact) { FactoryBot.create(:contact, position: position) }

    it 'should delete then redirect to the position' do
      delete("/positions/#{position.id}/contacts/#{contact.id}")

      expect(response).to     have_http_status(:redirect)
      expect(Contact.count).to  eq(0)
    end
  end
end
