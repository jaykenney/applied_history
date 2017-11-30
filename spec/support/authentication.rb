module AuthenticationTestSupport
  def current_user
    @current_user ||= User.create(login: 'ABBA', password: 'test')
  end

  def login_with_current_user
    current_user

    visit '/login'

    fill_in 'Login',    with: 'ABBA'
    fill_in 'Password', with: 'test'

    click_on 'Login'
  end
end

RSpec.configure do |config|
  config.include AuthenticationTestSupport, type: :request
  config.include AuthenticationTestSupport, type: :feature

  config.before(:each, type: :request) do
    allow_any_instance_of(AuthenticatedConstraint).to receive(:current_user) { current_user }
  end
end
