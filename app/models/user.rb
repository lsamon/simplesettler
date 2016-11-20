# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  username        :string
#  email           :string
#  password_digest :string
#  country         :string
#  city            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :articles
  has_many :helpfuls
  has_many :feedbacks
end
