require 'rails_helper'

RSpec.feature 'User manages positions' do

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
    FactoryBot.create(:position, employer: 'Lunar Land')

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
end
