# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe '#factory' do
    it 'has a valid factory' do
      expect(build(:booking)).to be_valid
    end
  end
end
