# frozen_string_literal: true

module NationalHolidayDomain
  module DatabaseContext
    module Concerns
      module Database
        def self.db_instance(country_abbreviation)
          NationalHolidayDomain::DatabaseContext::NationalHolidayContext.new(country_abbreviation.downcase)
        end
      end
    end
  end
end
