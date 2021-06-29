# frozen_string_literal: true

require 'dry-struct'

module NationalHolidayDomain
  module Entities
    class Holiday < Dry::Struct
      include NationalHolidayDomain::Entities::Concerns::Types

      attribute :id, Nominal::String.default(::SecureRandom.uuid.freeze)
      attribute :name, Nominal::String.default(nil)
      attribute :optional, Nominal::Bool.default(false)
      attribute :month_day, Nominal::String.default(nil)
      attribute :country_abbreviation, Nominal::String.default(nil)
      attribute :owner, Nominal::String.default(nil)
      attribute :type, Nominal::String.default(nil)
    end
  end
end
