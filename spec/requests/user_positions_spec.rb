require 'rails_helper'

RSpec.describe 'Positions' do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET /users/:user_id/positions' do
    before { get "/users/#{user.id}/positions" }

    specify { expect(response).to have_http_status(:ok) }
  end
end
