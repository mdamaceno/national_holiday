# frozen_string_literal: true

require 'spec_helper'

describe NationalHolidayDomain::Map::UseCases do
  describe 'get_national_holidays' do
    let(:use_case) { NationalHolidayDomain::UseCases::Holiday::GetNationalHolidays }

    it 'returns an instance of GetNationalHolidays class' do
      expect(described_class.get_national_holidays).to be_instance_of use_case
    end
  end

  describe 'get_city_holidays' do
    let(:use_case) { NationalHolidayDomain::UseCases::Holiday::GetCityHolidays }

    it 'returns an instance of GetCityHolidays class' do
      expect(described_class.get_city_holidays).to be_instance_of use_case
    end
  end
end
