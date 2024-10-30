# spec/models/foul_spec.rb
require 'rails_helper'

RSpec.describe Foul, type: :model do
  describe 'associations' do
    it { should have_many(:plays).dependent(:nullify) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
