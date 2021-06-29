# frozen_string_literal: true

module NationalHolidayDomain
  module UseCases
    module Holiday
      class GetNationalHolidays
        include NationalHolidayDomain::DatabaseContext::Concerns

        def call(country_abbr)
          { holidays: get_in_database(country_abbr, { type: 'COUNTRY' }) }
        end

        private

        def get_in_database(country_abbr, filter)
          DatabaseOps.find_in_database(Database.db_instance(country_abbr).holidays, filter)
        end
      end
    end
  end
end
