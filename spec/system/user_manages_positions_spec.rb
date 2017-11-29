require 'rails_helper'

RSpec.feature 'User adds an employment search action' do

  scenario 'User adds a resume submission via a website' do
    visit '/'

    click_on 'Add Position'

    fill_in 'Title', with: 'Whaler on the Moon'
    fill_in 'Employer', with: 'Lunar Land'
    fill_in 'Location', with: 'The Moon'
    fill_in 'Source',   with: 'Indeed Website'
    fill_in 'URL',      with: 'www.indeed.com/blah/blah/moo.asp'

    click_on 'Create Position'

    click_on 'Add New Event'
    fill_in 'Description', with: 'Submitted Resume'

    fill_in 'Event On',    with: '11/21/17'

    click_on 'Create Event'

    expect(page).to have_content 'Whaler on the Moon'
    expect(page).to have_content 'Lunar Land'
    expect(page).to have_content 'Indeed Website'
    expect(page).to have_content 'www.indeed.com/blah/blah/moo.asp'
    expect(page).to have_content 'Pending'
    expect(page).to have_content '2017-11-21'
  end
end
