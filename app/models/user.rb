class User < ActiveRecord::Base
  has_many :articles
  has_many :helpfuls, dependent: :destroy
  has_many :feedbacks
  has_one :user_detail, dependent: :destroy
  has_one :appointment, dependent: :destroy
  has_one :payment
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates :email, presence: true


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      user.email = auth.info.email
      user.skip_confirmation!
    end
  end

  def self.admin
    where(admin: true).first
  end
end
