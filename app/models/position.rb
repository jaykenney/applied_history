class Position < ApplicationRecord
  # Contacts has a dependent -> restrict for events, so this makes sure
  # events are removed first.
  has_many :events,   dependent: :destroy, inverse_of: :position
  has_many :contacts, dependent: :destroy, inverse_of: :position

  enum status: {
    pending:      0,
    no_reply:     1,
    in_progress:  2,
    no_job:       3,
    offered:      4
  }

  validates :employer,  presence: true, uniqueness: { scope: :title }
  validates :title,     presence: true

  scope :by_status, -> {
    order(arel_table[:status].in([2,4]))
  }

  scope :by_employer, -> { order(:employer) }

  def to_s
    self.employer
  end
end
