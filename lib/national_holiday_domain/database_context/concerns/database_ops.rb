# frozen_string_literal: true

module NationalHolidayDomain
  module DatabaseContext
    module Concerns
      module DatabaseOps
        def self.find_in_database(collection, filter_by = {})
          collection = collection.select { |r| r[:type].eql?(filter_by[:type]) } unless filter_by[:type].nil?
          collection = collection.select { |r| r[:id].eql?(filter_by[:id]) } unless filter_by[:id].nil?

          collection
        end
      end
    end
  end
end
