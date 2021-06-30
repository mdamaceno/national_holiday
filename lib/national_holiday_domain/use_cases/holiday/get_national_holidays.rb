# frozen_string_literal: true

module NationalHolidayDomain
  module UseCases
    module Holiday
      class GetNationalHolidays
        include NationalHolidayDomain::DatabaseContext::Concerns
        include NationalHolidayCommons::Methods

        def call(year, country_abbr)
          year = year.to_i
          holidays = get_in_database(country_abbr, { type: 'COUNTRY' })

          %w[easter_day carnival_day good_friday corpus_christi_day].each do |holiday|
            holidays << build_catholic_holiday(holiday, year, country_abbr)
          end

          { holidays: holidays.sort { |a, b| a[:month] <=> b[:month] } }
        end

        private

        def get_in_database(country_abbr, filter)
          DatabaseOps.find_in_database(Database.db_instance(country_abbr).holidays, filter)
        end

        def build_catholic_holiday(holiday_name, year, country_abbr)
          date = DateTimeMethods.send(holiday_name.to_sym, year)
          dict = Dictionary.select_country(country_abbr)

          {
            name: dict['holidays'][holiday_name]['name'],
            month: date.month,
            day: date.day,
            optional: dict['holidays'][holiday_name]['optional'],
            owner: Country.code[country_abbr.upcase],
            type: dict['holidays'][holiday_name]['type']
          }
        end
      end
    end
  end
end
