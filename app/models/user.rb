class User < ActiveRecord::Base
  include Ratyrate
  ratyrate_rater
  strip_attributes collapse_spaces: true

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

  validates :email, email: true

  before_save :normalize_name
  after_create :subscribe_user_to_mailing_list

  enum kind: %i[admin client]

  def full_name
    "#{first_name} #{last_name}".strip if first_name || last_name
  end

  private

  def subscribe_user_to_mailing_list
    SubscribeUserToMailingListJob.perform_later(email)
  end

  def normalize_name
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end
end
