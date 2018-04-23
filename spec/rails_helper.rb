ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'factory_bot_rails'
require 'ffaker'
require 'shoulda/matchers'
require 'aasm/rspec'
require 'sucker_punch/testing/inline'
require 'rspec-cells'
require 'rspec-html-matchers'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include RSpecHtmlMatchers, type: :cell

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.filter_rails_from_backtrace!

  config.use_transactional_fixtures = true

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end

FactoryBot::SyntaxRunner.class_eval do
  include RSpec::Mocks::ExampleMethods
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
