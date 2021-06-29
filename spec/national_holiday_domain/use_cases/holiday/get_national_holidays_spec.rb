# frozen_string_literal: true

require 'spec_helper'

describe NationalHolidayDomain::UseCases::Holiday::GetNationalHolidays do
  let(:klass) { described_class.new }
  let(:holiday_model) { NationalHolidayDomain::Entities::Holiday }

  describe '#call' do
    before do
      allow(klass)
        .to receive(:get_in_database)
        .with(an_instance_of(String), an_instance_of(Hash))
        .and_return([holiday_model.new])
    end

    it 'returns a hash with an array of holidays' do
      result = klass.call('BR')

      expect(result[:holidays][0]).to be_instance_of holiday_model
    end
  end
end
