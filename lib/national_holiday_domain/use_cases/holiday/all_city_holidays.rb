# frozen_string_literal: true

module NationalHolidayDomain
  module UseCases
    module Holiday
      class AllCityHolidays
        include NationalHolidayDomain::DatabaseContext::Concerns

        def call(country_abbr, city_code)
          { holidays: get_in_database(country_abbr, { owner: city_code, type: 'CITY' }) }
        end

        private

        def get_in_database(country_abbr, filter)
          db_instance = Database.db_instance(country_abbr)
          holidays = DatabaseOps.find_in_database(db_instance.holidays, filter)
          city = DatabaseOps.find_in_database(db_instance.cities, { id: filter[:owner] }).first

          holidays.map do |h|
            h[:owner] = city[:name]
            h
          end
        end
      end
    end
  end
end
