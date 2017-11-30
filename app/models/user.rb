class User < ApplicationRecord
  has_secure_password

  has_many :positions, inverse_of: :user, dependent: :destroy

  validates :login, presence: true, uniqueness: true
end
