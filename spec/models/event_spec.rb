require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:position) { FactoryBot.create(:position) }

  describe '#valid?' do
    it 'expects description, event_on, and position' do
      expect(Event.new(position: position, description: 'D', event_on: Date.today)).to be_valid

      expect(Event.new(position: position, description: 'D')).to_not      be_valid
      expect(Event.new(position: position, event_on: Date.today)).to_not  be_valid
      expect(Event.new(description: 'D', event_on: Date.today)).to_not    be_valid
    end

    it 'expects description, position and event_on to be unique' do
      Event.create(position: position, description: 'D', event_on: Date.today)

      expect(Event.new(position: position, event_on: Date.today, description: 'D')).to_not be_valid
    end
  end

  describe '#event_on' do
    it 'should accept mm/dd/yy formats' do
      expect(Event.new(event_on: '2/20/16').event_on).to eq Date.civil(2016,2,20)
    end
  end

  describe '#to_s' do
    specify { expect(Event.new(description: 'E', event_on: '2/20/16').to_s).to eq 'E on 2016-02-20' }
  end
end
