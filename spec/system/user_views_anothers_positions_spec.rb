require 'rails_helper'

RSpec.feature 'User views another users positions' do

  let(:user) { FactoryBot.create(:user) }

  before do
    FactoryBot.create(:position, employer: 'A', user: user)
    FactoryBot.create(:position, employer: 'B', user: user)
  end

  scenario 'User views another users positions' do
    visit "/users/#{user.id}/positions"

    expect(page).to have_content 'A'
    expect(page).to have_content 'B'
  end
end
