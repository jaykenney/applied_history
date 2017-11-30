source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'bcrypt', '~> 3.1.7' # ActiveRecord#has_secure_password
gem 'pg',     '~> 0.18'  # Database (Postgres)
gem 'puma',   '~> 3.7'   # Rack Server
gem 'warden', '~> 1.2.6' # Authentication

# Assets
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier',   '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


group :development, :test do
  gem 'capybara',           '~> 2.16.1'  #Required for system tests.
  gem 'factory_bot_rails', '~> 4.8.0'
  gem 'rspec-rails',        '~> 3.7'     # Testing Framework
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)

# Tools
gem 'byebug',      '~> 9.1.0', group: %i(development test), platforms: %i(mri mingw x64_mingw)
gem 'web-console', '~> 3.5.1', group: %i(development)
