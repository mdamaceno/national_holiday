# frozen_string_literal: true

module NationalHolidayDomain
  module DatabaseContext
    module Concerns
      module DatabaseOps
        def self.find_in_database(collection, filter_by = {})
          unless filter_by[:type].nil?
            collection = collection.select { |r| r[:type] === filter_by[:type] }
          end

          collection
        end
      end
    end
  end
end
