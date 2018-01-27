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
end

group :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'wisper-rspec', '~> 1.0'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
