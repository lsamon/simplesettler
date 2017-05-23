class User < ActiveRecord::Base
  has_many :articles
  has_many :helpfuls
  has_many :feedbacks
  has_one :user_detail, dependent: :destroy
  has_many :appointments
  has_one :payment
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
    end
  end

  def self.get_admin
    where(admin: true).first
  end
end
