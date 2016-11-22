class User < ActiveRecord::Base
  has_many :articles
  has_many :helpfuls
  has_many :feedbacks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
