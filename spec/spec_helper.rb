# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'support/rspec4_defaults'

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.filter_run_when_matching :focus

  config.profile_examples = 10
  config.order            = :random

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  Kernel.srand config.seed
end
