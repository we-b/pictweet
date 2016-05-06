class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # association
  has_many :tweets

  # validation
  validates_uniqueness_of :nickname
  validates_presence_of :nickname

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true
end
