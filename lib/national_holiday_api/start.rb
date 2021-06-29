# frozen_string_literal: true

module NationalHolidayApi
  class Start < Sinatra::Base
    include NationalHolidayDomain::Map

    before do
      content_type :json
    end

    get '/holidays/:year/:country_abbr' do
      result = UseCases.get_national_holidays.call(params[:year], params[:country_abbr])
      result.to_json
    end

    get '/holidays/:country_abbr/city/:city_code' do
      result = UseCases.get_city_holidays.call(params[:country_abbr], params[:city_code])
      result.to_json
    end
  end
end
