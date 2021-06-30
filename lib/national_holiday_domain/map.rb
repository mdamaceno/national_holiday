# frozen_string_literal: true

module NationalHolidayDomain
  module Map
    module UseCases
      include NationalHolidayDomain::UseCases::Holiday

      def self.all_national_holidays
        AllNationalHolidays.new
      end

      def self.all_city_holidays
        AllCityHolidays.new
      end
    end
  end
end
