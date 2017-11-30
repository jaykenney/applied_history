module Login
  def login_with(login:, password:)
    User.create(login: login, password: password)

    visit '/login'

    fill_in 'Login',     with: login
    fill_in 'Password', with: password

    click_on 'Login'
  end
end

RSpec.configure do |config|
  config.include Login, type: :feature

  config.before(:each, type: :request) do
    current_user = User.create(login: 'ABBA', password: 'test')

    allow_any_instance_of(AuthenticatedConstraint).to receive(:current_user) { current_user }
  end
end
