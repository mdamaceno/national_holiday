# frozen_string_literal: true

module NationalHolidayDomain
  module Map
    module UseCases
      include NationalHolidayDomain::UseCases::Holiday

      def self.get_national_holidays
        GetNationalHolidays.new
      end

      def self.get_city_holidays
        GetCityHolidays.new
      end
    end
  end
end
