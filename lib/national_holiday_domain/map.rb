# frozen_string_literal: true

module NationalHolidayDomain
  module Map
    module UseCases
      include NationalHolidayDomain::UseCases::Holiday

      def get_national_holidays
        GetNationalHolidays.new
      end
    end
  end
end

