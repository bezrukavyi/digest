require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
# require "active_job/railtie"
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
# require "action_cable/engine"
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Digestify
  class Application < Rails::Application
    config.load_defaults 5.1

    config.generators do |g|
      g.test_framework :rspec
      g.factory_bot dir: 'spec/factories'
    end

    config.autoload_paths += Dir[Rails.root.join('app', 'validators', '**', '*.rb')].each { |f| require f }

    config.action_mailer.preview_path = Rails.root.join('spec', 'mailers', 'previews')

    config.after_initialize do
      Rails.application.routes.default_url_options[:host] = ENV['DOMAIN']
    end
  end
end
