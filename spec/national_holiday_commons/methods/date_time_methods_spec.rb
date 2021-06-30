# frozen_string_literal: true

require 'spec_helper'

describe NationalHolidayCommons::Methods::DateTimeMethods do
  let(:random_year) { rand(2000..2030) }

  describe '.add_days' do
    it 'add n days to time' do
      now = Time.now.utc
      number_of_days = rand(-100..100)
      datetime = described_class.add_days(now, number_of_days)

      expect(((datetime - now) / 24 / 60 / 60).round).to eq number_of_days
    end
  end

  describe '.easter_day' do
    it 'is sunday' do
      date = described_class.easter_day(random_year)

      expect(date.sunday?).to be(true)
    end
  end

  describe '.carnival_day' do
    it 'is 47 days before easter day' do
      easter_day = described_class.easter_day(random_year)
      carnival_day = described_class.carnival_day(random_year)

      expect(((easter_day - carnival_day) / 24 / 60 / 60).round).to eq 47
    end

    it 'is tuesday' do
      date = described_class.carnival_day(random_year)

      expect(date.tuesday?).to be(true)
    end
  end

  describe '.good_friday' do
    it 'is 2 days before easter day' do
      easter_day = described_class.easter_day(random_year)
      good_friday = described_class.good_friday(random_year)

      expect(((easter_day - good_friday) / 24 / 60 / 60).round).to eq 2
    end

    it 'is friday' do
      date = described_class.good_friday(random_year)

      expect(date.friday?).to be(true)
    end
  end

  describe '.corpus_christi_day' do
    it 'is 60 days after easter day' do
      easter_day = described_class.easter_day(random_year)
      corpus_christi_day = described_class.corpus_christi_day(random_year)

      expect(((corpus_christi_day - easter_day) / 24 / 60 / 60).round).to eq 60
    end
  end
end
