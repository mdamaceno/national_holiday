# frozen_string_literal: true

module NationalHolidayCommons
  module Methods
    module DateTimeMethods
      def self.add_days(time, n_days)
        t2 = time + (n_days * 24 * 60 * 60)
        utc_delta = time.utc_offset - t2.utc_offset
        utc_delta.zero? ? t2 : t2 + utc_delta
      end
    end
  end
end
