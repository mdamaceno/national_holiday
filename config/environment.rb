# frozen_string_literal: true

if !ENV['RACK_ENV']
  ENV['RACK_ENV'] = 'development'
else
  valid_envs = %w[development production test]
  unless valid_envs.include?(ENV['RACK_ENV'])
    puts "Environment '#{ENV['RACK_ENV']}' is invalid, must be one of #{valid_env}"
    exit(1)
  end
end

require 'rubygems'
require 'bundler'

Bundler.require(:default)

if %w[development test].include? ENV['RACK_ENV']
  Bundler.require(:development)
  Bundler.require(:test)

  require 'pry'
  require 'pry-byebug'
end

require 'dotenv'

Dotenv.load('.env.development') if ENV['RACK_ENV'] == 'development'
Dotenv.load('.env.test') if ENV['RACK_ENV'] == 'test'

require 'date'
require 'securerandom'

Zeitwerk::Loader.new.tap do |loader|
  lib_path = File.expand_path('../lib', __dir__)
  loader.push_dir(lib_path)
  loader.setup

  loader.eager_load if ENV['RACK_ENV'] == 'production'
end

class AppEnvironment
  include Singleton

  attr_reader :env

  ROOT_PATH = File.expand_path('../', __dir__)

  def boot!
    raise 'App is already booted. Aborting.' if @booted

    @booted = true
    @env = ENV['RACK_ENV']
  end

  def mongo_conn_string(database)
    "#{ENV['MONGO_URL']}/#{database}?authSource=admin&replicaSet=rs0"
  end
end
