class Tweet < ActiveRecord::Base
  # association
  belongs_to :user
  has_many :likes

  # validation
  validates_presence_of :image, :text, :user_id
end
