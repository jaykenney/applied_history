class Event < ApplicationRecord
  belongs_to :contact,  inverse_of: :events, optional: true
  belongs_to :position, inverse_of: :events, touch:    true

  validates :description, presence: true, uniqueness: { scope: %i(position event_on) }
  validates :event_on,    presence: true

  attribute :event_on, MmddyyAttribute.new

  def to_s
    "#{self.description} on #{self.event_on}"
  end
end
