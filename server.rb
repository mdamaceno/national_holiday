#!/usr/bin/env ruby
# frozen_string_literal: true

require File.expand_path('config/environment.rb', __dir__)

AppEnvironment.instance.boot!

class Server < Sinatra::Base
  include NationalHolidayDomain::Map

  set :server, :puma
  set :bind, '0.0.0.0'
  set :port, '8090'

  before do
    content_type :json
  end

  get '/holidays/:year/:country_abbr' do
    result = UseCases.all_national_holidays.call(params[:year], params[:country_abbr])
    result.to_json
  end

  get '/holidays/:country_abbr/city/:city_code' do
    result = UseCases.all_city_holidays.call(params[:country_abbr], params[:city_code])
    result.to_json
  end

  run! if app_file == $PROGRAM_NAME
end
