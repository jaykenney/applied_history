class Contact < ApplicationRecord
  belongs_to  :position,  inverse_of: :contacts,  touch:      true
  has_many    :events,    inverse_of: :contact,   dependent:  :restrict_with_error

  validates :email, format:     { with: /\A\S+@.+\.\S+\z/, allow_blank: true },
                    uniqueness: { scope: :name }
  validates :phone, format:     { with: /\A(\+\d+ |)\(\d{3}\) \d{3}-\d{4}\z/, allow_blank: true },
                    uniqueness: { scope: :name }

  validates :name,  presence: true

  scope :by_name, -> { order(:name) }

  def to_s
    self.name
  end
end
