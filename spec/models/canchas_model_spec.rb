# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cancha, type: :model do
  describe '#factory' do
    it 'has a valid factory' do
      expect(build(:cancha)).to be_valid
    end
  end
end
