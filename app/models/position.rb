class Position < ApplicationRecord
  has_many :events, dependent: :destroy, inverse_of: :position

  enum status: {
    pending:      0,
    no_reply:     1,
    in_progress:  2,
    no_job:       3,
    offered:      4
  }

  validates :employer,  presence: true, uniqueness: { scope: :title }
  validates :title,     presence: true
end
