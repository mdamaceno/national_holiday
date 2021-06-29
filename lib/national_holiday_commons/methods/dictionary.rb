# frozen_string_literal: true

require 'yaml'

module NationalHolidayCommons
  module Methods
    module Dictionary
      EXCEPTIONAL_CONFIG_PATH = File.join(
        AppEnvironment::ROOT_PATH,
        'lib',
        'national_holiday_commons',
        'exceptional_config'
      )

      def self.select_country(country_abbr)
        YAML.load_file(File.join(EXCEPTIONAL_CONFIG_PATH, "#{country_abbr.downcase}.yml"))
      end
    end
  end
end
