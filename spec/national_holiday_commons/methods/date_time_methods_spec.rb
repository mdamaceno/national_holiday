# frozen_string_literal: true

require 'spec_helper'

describe NationalHolidayCommons::Methods::DateTimeMethods do
  describe '#add_days' do
    it 'add n days to time' do
      now = Time.now.utc
      number_of_days = rand(-100..100)
      datetime = described_class.add_days(now, number_of_days)

      expect(((datetime - now) / 24 / 60 / 60).round).to eq number_of_days
    end
  end

  describe '#easter_day' do
    it 'is sunday' do
      date = described_class.easter_day(rand(2000..2030))

      expect(date.sunday?).to be(true)
    end
  end
end
