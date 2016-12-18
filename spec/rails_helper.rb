ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'factory_girl_rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include FactoryGirl::Syntax::Methods
  config.before :suite do
    Warden.test_mode!
  end
  config.after :each do
    Warden.test_reset!
  end
  config.after(:suite) do
    DatabaseCleaner.clean
  end
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
