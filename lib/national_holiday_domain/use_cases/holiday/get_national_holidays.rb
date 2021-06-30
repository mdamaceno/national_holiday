# frozen_string_literal: true

module NationalHolidayDomain
  module UseCases
    module Holiday
      class GetNationalHolidays
        include NationalHolidayDomain::DatabaseContext::Concerns
        include NationalHolidayCommons::Methods

        def call(year, country_abbr)
          holidays = get_in_database(country_abbr, { type: 'COUNTRY' })
          holidays << build_easter_day(year.to_i, country_abbr)
          holidays << build_carnival_day(year.to_i, country_abbr)

          { holidays: holidays.sort { |a, b| a[:month] <=> b[:month] } }
        end

        private

        def get_in_database(country_abbr, filter)
          DatabaseOps.find_in_database(Database.db_instance(country_abbr).holidays, filter)
        end

        def build_easter_day(year, country_abbr)
          date = DateTimeMethods.easter_day(year)
          dict = Dictionary.select_country(country_abbr)

          {
            name: dict['holidays']['easter_day']['name'],
            month: date.month,
            day: date.day,
            optional: dict['holidays']['easter_day']['optional'],
            owner: Country.code[country_abbr.upcase],
            type: dict['holidays']['easter_day']['type']
          }
        end

        def build_carnival_day(year, country_abbr)
          date = DateTimeMethods.carnival_day(year)
          dict = Dictionary.select_country(country_abbr)

          {
            name: dict['holidays']['carnival_day']['name'],
            month: date.month,
            day: date.day,
            optional: dict['holidays']['carnival_day']['optional'],
            owner: Country.code[country_abbr.upcase],
            type: dict['holidays']['carnival_day']['type']
          }
        end
      end
    end
  end
end
