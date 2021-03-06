# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.2.3'
# Use Puma as the app server
gem 'puma', '~> 5.1.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.2.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.10.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.12.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.5.1', require: false

gem 'cloudinary', '~> 1.18.1'
gem 'devise', '~> 4.7.3'
gem 'devise-i18n', '~> 1.9.2'
gem 'faker', '~> 2.15.1'
gem 'haml-rails', '~> 2.0.1'
gem 'pundit', '~> 2.1.0'
gem 'rails-i18n', '~> 6.0.0'
gem 'redis', '~> 4.2.5'
gem 'sidekiq', '~> 6.1.2'
gem 'sidekiq-failures', '~> 1.0.0'
gem 'simple_form', '~> 5.0.3'

group :development do
  gem 'annotate', '~> 3.1.1'
  gem 'better_errors', '~> 2.9.1'
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'colorize', '~> 0.8.1'
  gem 'flamegraph', '~> 0.9.5'
  gem 'listen', '~> 3.3.3'
  gem 'memory_profiler', '~> 1.0.0'
  gem 'overcommit', '~> 0.57.0'
  gem 'rack-mini-profiler', '~> 2.2.0'
  gem 'rubocop', '~> 1.6.1', require: false
  gem 'rubocop-performance', '~> 1.9.1', require: false
  gem 'rubocop-rails', '~> 2.9.1', require: false
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'stackprof', '~> 0.2.16'
  gem 'web-console', '~> 4.1.0'
end

group :development, :test do
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'pry-byebug', '~> 3.9.0'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rubocop-rspec', '~> 2.1.0', require: false
  gem 'shoulda-matchers', '~> 4.4.1'
end

group :test do
  gem 'simplecov', '~> 0.20.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
