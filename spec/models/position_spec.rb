require 'rails_helper'

RSpec.describe Position, type: :model do

  describe '#valid?' do
    it 'expects only employer and title to be present' do
      expect(Position.new(employer: 'E', title: 'T')).to be_valid
      expect(Position.new).to_not be_valid
    end

    it 'requires uniqueness of employer/title' do
      Position.create(employer: 'E', title: 'T')
      expect(Position.new(employer: 'E', title: 'T')).to_not be_valid
    end
  end

  describe '#status' do
    it 'should default to pending' do
      expect(Position.new).to be_pending
    end
  end
end
