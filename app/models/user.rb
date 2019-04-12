class User < ActiveRecord::Base
  include Ratyrate
  ratyrate_rater

  has_many :articles
  has_many :helpfuls, dependent: :destroy
  has_many :feedbacks
  has_one :user_detail, dependent: :destroy
  has_one :appointment, dependent: :destroy
  has_one :payment
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true

  after_create :subscribe_user_to_mailing_list

  def self.admin
    where(admin: true).first
  end

  private
  def subscribe_user_to_mailing_list
    SubscribeUserToMailingListJob.perform_later(email)
  end
end
