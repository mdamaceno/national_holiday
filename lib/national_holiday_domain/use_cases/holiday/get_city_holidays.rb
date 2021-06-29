# frozen_string_literal: true

module NationalHolidayDomain
  module UseCases
    module Holiday
      class GetCityHolidays
        include NationalHolidayDomain::DatabaseContext::Concerns

        def call(country_abbr, city_code)
          { holidays: get_in_database(country_abbr, { owner: city_code, type: 'CITY' }) }
        end

        private

        def get_in_database(country_abbr, filter)
          DatabaseOps.find_in_database(Database.db_instance(country_abbr).holidays, filter)
        end
      end
    end
  end
end
