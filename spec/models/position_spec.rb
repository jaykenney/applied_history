require 'rails_helper'

RSpec.describe Position, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe '#valid?' do
    it 'expects only employer, title, user to be present' do
      expect(Position.new(employer: 'E', title: 'T', user: user)).to be_valid
      expect(Position.new).to_not be_valid
    end

    it 'requires uniqueness of employer/title' do
      Position.create(employer: 'E', title: 'T', user: user)
      expect(Position.new(employer: 'E', title: 'T', user: user)).to_not be_valid
    end
  end

  describe '#status' do
    it 'should default to pending' do
      expect(Position.new).to be_pending
    end
  end

  describe '#to_s' do
    specify { expect(Position.new(employer: 'E').to_s).to eq 'E' }
  end
end
