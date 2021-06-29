# frozen_string_literal: true

require 'spec_helper'

describe NationalHolidayDomain::UseCases::Holiday::GetCityHolidays do
  let(:klass) { described_class.new }

  describe '#call' do
    it 'returns a hash with an array of holidays' do
      result = klass.call('BR', '3136702')

      expect(result[:holidays][0]).to include(
        name: a_kind_of(String),
        month_day: a_kind_of(String),
        owner: a_kind_of(String),
        type: a_kind_of(String),
        optional: be(true).or(be(false))
      )
    end
  end
end
