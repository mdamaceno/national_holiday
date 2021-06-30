# frozen_string_literal: true

module NationalHolidayCommons
  module Methods
    module DateTimeMethods
      def self.add_days(time, n_days)
        t2 = time + (n_days * 24 * 60 * 60)
        utc_delta = time.utc_offset - t2.utc_offset
        utc_delta.zero? ? t2 : t2 + utc_delta
      end

      def self.easter_day(year)
        a = year % 19
        b = year / 100
        c = year % 100
        d = b / 4
        e = b % 4
        f = (b + 8) / 25
        g = (b - f + 1) / 3
        h = (19 * a + b - d - g + 15) % 30
        i = c / 4
        k = c % 4
        l = (32 + 2 * e + 2 * i - h - k) % 7
        m = (a + 11 * h + 22 * l) / 451
        month = (h + l - 7 * m + 114) / 31
        day = 1 + (h + l - 7 * m + 114) % 31

        Time.new(year, month, day)
      end

      def self.carnival_day(year)
        add_days(easter_day(year), -47)
      end

      def self.good_friday(year)
        add_days(easter_day(year), -2)
      end

      def self.corpus_christi_day(year)
        add_days(easter_day(year), 60)
      end
    end
  end
end
