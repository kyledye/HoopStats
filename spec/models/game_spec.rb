require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'associations' do
    it { should belong_to(:season) }
    it { should belong_to(:team) }
    it { should belong_to(:opponent).class_name('Team') }
    it { should have_many(:plays).dependent(:destroy) }
  end

  describe 'custom validations' do
    context 'when date_time is present' do
      it 'is valid if date_time is a DateTime' do
        game = Game.new(date_time: Time.zone.now)
        game.valid?
        expect(game.errors[:date_time]).to be_empty
      end

      # it 'is invalid if date_time is not a DateTime' do
      #   game = Game.new(date_time: "invalid date")
      #   game.valid?
      #   expect(game.errors[:date_time]).to include("must be a valid DateTime or nil")
      # end
    end

    context 'when date_time is nil' do
      it 'is valid if date_time is nil' do
        game = Game.new(date_time: nil)
        game.valid?
        expect(game.errors[:date_time]).to be_empty
      end
    end
  end
end
