# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :request do
  before(:all) do
    @review = create(:review)
    @review.save
    @user = User.find(@review.user_id)
  end

  describe 'crear review' do
    it 'deberia crear una review' do
      expect(@review).to be_valid
    end
  end

  describe 'eliminar review' do
    it 'deberia eliminar una review' do
      expect(@review.destroy).to be_truthy
    end
  end

  describe 'editar review' do
    it 'deberia editar una review' do
      expect(@review.update(content: 'Nuevo contenido')).to be_truthy
    end
  end
end
