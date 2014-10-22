class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:email]
  belongs_to :user
  has_many :tweets

  #usernameを必須とする
  validates_uniqueness_of :username
  validates_presence_of :username
  # validates :username, presence: true, uniqueness: true

  #emailを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["email = :value", { :value => email }]).first
    else
      where(conditions).first
    end
  end

  #emailを不要とする
  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end

end
