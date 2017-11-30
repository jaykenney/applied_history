class Position < ApplicationRecord
  # Contacts has a dependent -> restrict for events, so this makes sure
  # events are removed first.
  belongs_to  :user,      inverse_of: :positions
  has_many    :events,    inverse_of: :position,  dependent: :destroy
  has_many    :contacts,  inverse_of: :position,  dependent: :destroy

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
