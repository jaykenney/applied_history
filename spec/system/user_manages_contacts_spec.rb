require 'rails_helper'

RSpec.feature 'User manages contacts' do
  before { login_with(login: 'ABBA', password: 'test') }

  let!(:position) { FactoryBot.create(:position, employer: 'The Moon') }

  scenario 'User adds a contact to a position' do
    visit '/'

    click_on 'The Moon'
    click_on 'Contacts'
    click_on 'Add New Contact'

    fill_in 'Name',   with: 'Mr. Johnson'
    fill_in 'Email',  with: 'noreply@gmail.com'
    fill_in 'Phone',  with: '+1 (918) 867-5309'

    click_on 'Create Contact'
  end

  scenario 'User edits a contact' do
    FactoryBot.create(:contact, name: 'Mr. Johnson', position: position)

    visit '/'

    click_on 'The Moon'
    click_on 'Contacts'
    click_on 'Edit Mr. Johnson'

    fill_in   'Name', with: 'Mr. Sandman'
    click_on  'Update Contact'
  end

  scenario 'User deletes a contact' do
    FactoryBot.create(:contact, name: 'Mr. Johnson', position: position)

    visit '/'

    click_on 'The Moon'
    click_on 'Contacts'
    click_on 'Remove Mr. Johnson'
  end
end
