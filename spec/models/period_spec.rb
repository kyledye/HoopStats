# spec/models/period_spec.rb
require 'rails_helper'

RSpec.describe Period, type: :model do
  describe 'associations' do
    it { should have_many(:plays).dependent(:nullify) }
  end

  describe 'dependent: :nullify behavior' do
    let(:period) { create(:period) }
    let!(:play) { create(:play, period: period) }

    it 'nullifies plays when the period is destroyed' do
      expect { period.destroy }.to change { play.reload.period_id }.from(period.id).to(nil)
    end
  end
end
