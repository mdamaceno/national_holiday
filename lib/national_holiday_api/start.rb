# frozen_string_literal: true

module NationalHolidayApi
  class Start < Sinatra::Base
    include NationalHolidayDomain::Map::UseCases

    before do
      content_type :json
    end

    get '/holidays/:country_abbr' do
      result = get_national_holidays.call(params[:country_abbr])
      result.to_json
    end
  end
end

