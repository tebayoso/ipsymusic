# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'active_model_serializers', '~> 0.10.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'faker'
gem 'fast_jsonapi'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'redis', '~> 4.0'
gem 'searchkick'
gem 'swagger-blocks'
gem 'swagger_ui_engine'
gem 'factory_bot_rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'json_matchers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
