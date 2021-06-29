# frozen_string_literal: true

module NationalHolidayDomain
  module DatabaseContext
    module Concerns
      module DatabaseOps
        def self.find_in_database(collection, filter_by = {})
          result = collection
            .map { |c| c.to_h }

          unless filter_by[:type].nil?
            result = result.select { |r| r[:type] === filter_by[:type] }
          end

          result
        end
      end
    end
  end
end
