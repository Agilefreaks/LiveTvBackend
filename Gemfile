# frozen_string_literal: true
source 'https://rubygems.org'

gem 'rake'

# Web framework
gem 'dry-web', '>= 0.6.0'
gem 'dry-web-roda', '>= 0.6.0'
gem 'puma'
gem 'rack_csrf'

gem 'rack', '>= 2.0'
gem 'shotgun', '>= 0.9.2'

# Database persistence
gem 'rom', '>= 3.1.0'
gem 'rom-repository'
gem 'rom-sql', '>= 1.1.0'

# Application dependencies
gem 'dry-matcher'
gem 'dry-monads'
gem 'dry-struct'
gem 'dry-transaction'
gem 'dry-types'
gem 'dry-validation'
gem 'dry-view', '>= 0.2.2'
gem 'graphql'
gem 'slim'

# Fake it until you make it
gem 'faker'

group :development, :test do
  gem 'pry-byebug', platform: :mri
  gem 'rubocop'
  gem 'rubocop-rspec'
end

group :test do
  gem 'database_cleaner'
  gem 'rack-test'
  gem 'rspec'
  gem 'rspec-its'
end
