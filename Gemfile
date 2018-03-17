source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails', '~> 1.0'
gem 'aasm', '~> 4.12'
gem 'friendly_id', '~> 5.2', '>= 5.2.3'
gem 'sucker_punch', '~> 2.0.4'
gem 'rufus-scheduler', '~> 3.4', '>= 3.4.2'
gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'rectify', '~> 0.10.0'
gem 'email_validator', '~> 1.6'
gem 'operators-service', '~> 0.1.0'
gem 'cancancan', '~> 2.1', '>= 2.1.2'
gem 'dotenv-rails', '~> 2.2'
gem 'bootstrap', '~> 4.0.0'
gem 'kaminari', '~> 0.17.0'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'meta-tags', '~> 2.7'
gem 'trailblazer', '~> 2.1.0.beta3'
gem 'trailblazer-rails', '~> 2.1'
gem 'reform', '~> 2.2.4'
gem 'cells-rails', '~> 0.0.8'
gem 'cells-haml', '~> 0.0.10'
gem 'dry-matcher', '~> 0.7.0'
gem 'omniauth', '~> 1.8', '>= 1.8.1'
gem 'omniauth-facebook', '~> 4.0'
gem 'omniauth-google-oauth2', '~> 0.5.3'
gem 'pundit', '~> 1.1'
gem 'representable', '~> 3.0', '>= 3.0.4'
gem 'devise_token_auth', '~> 0.1.42'
gem 'rack-cors', require: 'rack/cors'
gem 'responders', '~> 2.4'

group :development, :test do
  gem 'ffaker', '~> 2.7'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'letter_opener_web', '~> 1.3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'bullet', '~> 5.7', '>= 5.7.2'

  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-bundler', '~> 1.3', require: false
  gem 'capistrano-rails', '~> 1.3', require: false
  gem 'rvm1-capistrano3', '1.4.0', require: false
end

group :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'wisper-rspec', '~> 1.0'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'rspec-cells', '~> 0.3.4'
  gem 'rspec-html-matchers', '~> 0.9.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
