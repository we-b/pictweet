class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true

  has_attached_file :photo, :styles => { :medium => "300x300>" }, :url => "/system/:hash.:extension", :hash_secret => "longSecretString"

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
