class Tweet < ActiveRecord::Base
  # association
  belongs_to :user

  # validation
  validates_presence_of :image, :text, :user_id
end
