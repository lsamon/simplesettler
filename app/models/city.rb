# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string
#  country     :string
#  description :text
#  population  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class City < ActiveRecord::Base
  has_many :articles
  has_many :feedbacks


  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
