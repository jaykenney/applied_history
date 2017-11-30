require 'rails_helper'

RSpec.feature 'User manages positions' do
  before { login_with_current_user }

  scenario 'User adds a position' do
    visit '/'
    click_on 'Add Position'

    fill_in 'Title', with: 'Whaler on the Moon'
    fill_in 'Employer', with: 'Lunar Land'
    fill_in 'Location', with: 'The Moon'
    fill_in 'Source',   with: 'Indeed Website'
    fill_in 'URL',      with: 'www.indeed.com/blah/blah/moo.asp'

    click_on 'Create Position'

    expect(page).to have_content 'Whaler on the Moon'
    expect(page).to have_content 'Lunar Land'
    expect(page).to have_content 'Indeed Website'
    expect(page).to have_content 'www.indeed.com/blah/blah/moo.asp'
  end

  scenario 'User adds an event to a position and changes its status' do
    FactoryBot.create(:position, employer: 'Lunar Land', user: current_user)

    visit '/'
    click_on 'Lunar Land'

    click_on 'Add New Event'
    fill_in 'Description', with: 'Submitted Resume'

    fill_in 'Event On',    with: '11/21/17'

    click_on 'Create Event'

    click_on 'Edit'

    select 'In Progress', from: 'Status'

    click_on 'Update Position'

    expect(page).to have_content 'Lunar Land'
    expect(page).to have_content 'In Progress'
    expect(page).to have_content 'Submitted Resume'
    expect(page).to have_content '2017-11-21'
  end

  scenario 'User deletes a position' do
    FactoryBot.create(:position, employer: 'Lunar Land', user: current_user)

    visit '/'
    click_on 'Lunar Land'
    click_on 'Delete'

    expect(page).to_not have_content 'Lunar Land'
  end

  scenario 'User edits an event for a position' do
    FactoryBot.create(:position, :with_event, employer: 'Lunar Land', event_description: 'Submitted Resume', user: current_user)
    visit '/'
    click_on 'Lunar Land'
    click_on 'Submitted Resume'

    fill_in 'Event On', with: '1/12/12'

    click_on 'Update Event'

    expect(page).to have_content '2012-01-12'
  end

  scenario 'User deletes an event from a position' do
    FactoryBot.create(:position, :with_event, employer: 'Lunar Land', event_description: 'Submitted Resume', user: current_user)

    visit '/'
    click_on 'Lunar Land'
    click_on 'Remove Submitted Resume'

    expect(page).to_not have_content 'Submitted Resume'
  end
end
