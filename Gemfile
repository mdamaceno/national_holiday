# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.1'

gem 'json'
gem 'puma'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'zeitwerk'

group :develepment do
  gem 'rubocop'
  gem 'rubocop-rspec', require: false
  gem 'solargraph'
end

group :develepment, :test do
  gem 'dotenv'
  gem 'pry'
  gem 'pry-byebug'
end

group :test do
  gem 'rspec'
end
