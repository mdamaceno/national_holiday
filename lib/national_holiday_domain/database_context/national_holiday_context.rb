# frozen_string_literal: true

require 'csv'

module NationalHolidayDomain
  module DatabaseContext
    include Concerns::Database

    class NationalHolidayContext
      COLLECTIONS_PATH = File.join(
        AppEnvironment::ROOT_PATH,
        'lib',
        'national_holiday_domain',
        'database_context',
        'collections'
      )

      def initialize(country_abbreviation)
        @country_abbreviation = country_abbreviation
      end

      def holidays
        content = CSV.parse(File.read(build_holidays_file_path), headers: true, header_converters: :symbol,
                                                                 col_sep: ';')
        content
          .to_a
          .map do |_id, name, month_day, optional, owner, type|
            {
              name: name,
              month_day: month_day,
              optional: optional === 'true',
              owner: owner,
              type: type
            }
          end.drop(1)
      end

      private

      def build_holidays_file_path
        File.join(COLLECTIONS_PATH, 'holidays', "#{@country_abbreviation}.csv")
      end
      end
    end
  end
end
