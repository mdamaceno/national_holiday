# frozen_string_literal: true

require 'spec_helper'

describe NationalHolidayDomain::UseCases::Holiday::AllCityHolidays do
  let(:klass) { described_class.new }

  describe '#call' do
    it 'returns a hash with an array of holidays' do
      city_code = '3136702'
      result = klass.call('BR', city_code)

      expect(result[:holidays][0]).to include(
        name: a_kind_of(String),
        month: a_kind_of(Integer),
        day: a_kind_of(Integer),
        owner: eq('Juiz de Fora'),
        type: eq('CITY'),
        optional: be(true).or(be(false))
      )
    end
  end
end
