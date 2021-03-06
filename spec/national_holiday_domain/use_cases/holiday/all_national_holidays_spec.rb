# frozen_string_literal: true

require 'spec_helper'

describe NationalHolidayDomain::UseCases::Holiday::AllNationalHolidays do
  let(:klass) { described_class.new }

  describe '#call' do
    it 'returns a hash with an array of holidays' do
      result = klass.call(2021, 'BR')

      expect(result[:holidays][0]).to include(
        name: a_kind_of(String),
        month: a_kind_of(Integer),
        day: a_kind_of(Integer),
        owner: a_kind_of(String),
        type: a_kind_of(String),
        optional: be(true).or(be(false))
      )
    end

    it 'the hash contains a array that contains Easter Day' do
      result = klass.call(2021, 'BR')

      expect(result[:holidays]).to include(
        {
          name: eq('Páscoa'),
          month: a_kind_of(Integer),
          day: a_kind_of(Integer),
          owner: eq('Brazil'),
          type: eq('COUNTRY'),
          optional: be(true).or(be(false))
        }
      )
    end

    it 'the hash contains a array that contains Carnival Day' do
      result = klass.call(2021, 'BR')

      expect(result[:holidays]).to include(
        {
          name: eq('Carnaval'),
          month: a_kind_of(Integer),
          day: a_kind_of(Integer),
          owner: eq('Brazil'),
          type: eq('COUNTRY'),
          optional: be(true).or(be(false))
        }
      )
    end

    it 'the hash contains a array that contains Good Friday' do
      result = klass.call(2021, 'BR')

      expect(result[:holidays]).to include(
        {
          name: eq('Paixão de Cristo'),
          month: a_kind_of(Integer),
          day: a_kind_of(Integer),
          owner: eq('Brazil'),
          type: eq('COUNTRY'),
          optional: be(true).or(be(false))
        }
      )
    end

    it 'the hash contains a array that contains Corpus Christi Day' do
      result = klass.call(2021, 'BR')

      expect(result[:holidays]).to include(
        {
          name: eq('Corpus Christi'),
          month: a_kind_of(Integer),
          day: a_kind_of(Integer),
          owner: eq('Brazil'),
          type: eq('COUNTRY'),
          optional: be(true).or(be(false))
        }
      )
    end
  end
end
