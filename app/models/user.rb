class User < ActiveRecord::Base
  # association
  has_many :tweets

  # validation
  validates_uniqueness_of :nickname
  validates_presence_of :nickname
end
