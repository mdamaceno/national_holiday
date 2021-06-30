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
        content = parse_csv(build_holidays_file_path)
        content
          .to_a
          .map do |_id, name, month, day, optional, owner, type|
          {
            name: name,
            month: month.respond_to?(:to_i) ? month.to_i : month,
            day: day.respond_to?(:to_i) ? day.to_i : day,
            optional: optional.eql?('true'),
            owner: owner,
            type: type
          }
        end.drop(1)
      end

      def cities
        content = parse_csv(build_cities_file_path)
        content
          .to_a
          .map do |id, name|
            {
              id: id,
              name: name
            }
          end.drop(1)
      end

      private

      def parse_csv(file_path)
        CSV.parse(File.read(file_path), headers: true, header_converters: :symbol, col_sep: ';')
      end

      def build_holidays_file_path
        File.join(COLLECTIONS_PATH, 'holidays', "#{@country_abbreviation}.csv")
      end

      def build_cities_file_path
        File.join(COLLECTIONS_PATH, 'cities', "#{@country_abbreviation}.csv")
      end
    end
  end
end
