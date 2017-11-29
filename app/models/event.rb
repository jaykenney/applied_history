class Event < ApplicationRecord
  belongs_to :position, inverse_of: :events

  validates :description, presence: true, uniqueness: { scope: %i(position event_on) }
  validates :event_on,    presence: true

  accepts_nested_attributes_for :position

  attribute :event_on, MmddyyAttribute.new
end
