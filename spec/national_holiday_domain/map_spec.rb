# frozen_string_literal: true

require 'spec_helper'

describe NationalHolidayDomain::Map::UseCases do
  describe 'all_national_holidays' do
    let(:use_case) { NationalHolidayDomain::UseCases::Holiday::AllNationalHolidays }

    it 'returns an instance of AllNationalHolidays class' do
      expect(described_class.all_national_holidays).to be_instance_of use_case
    end
  end

  describe 'all_city_holidays' do
    let(:use_case) { NationalHolidayDomain::UseCases::Holiday::AllCityHolidays }

    it 'returns an instance of AllCityHolidays class' do
      expect(described_class.all_city_holidays).to be_instance_of use_case
    end
  end
end
