require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:position) { FactoryBot.create(:position) }

  describe '#valid?' do
    let(:valid_attributes) do
      {
        email: 'no-reply@no-reply.org',
        name:  'Mr. Johnson',
        phone:  '(123) 456-7890',
        position: position
      }
    end

    it 'should be valid with valid_attributes' do
      expect(Contact.new(valid_attributes)).to be_valid
    end

    it 'expects name and position only' do
      expect(Contact.new(name: 'N', position: position)).to           be_valid
      expect(Contact.new(valid_attributes.except(:name))).to_not      be_valid
      expect(Contact.new(valid_attributes.except(:position))).to_not  be_valid
    end

    it 'expects email to be in email format' do
      expect(Contact.new(position: position, name: 'N', phone: '(123) 456-7890', email: 'E')).to_not be_valid
    end

    it 'expects phone to be in phone format' do
      expect( Contact.new(position: position, name: 'N', email: 'e@e.e', phone: '+12 (345) 678-9012')).to be_valid

      expect(Contact.new(position: position, name: 'N', email: 'e@e.e', phone: 'P')).to_not be_valid
    end
  end
end
