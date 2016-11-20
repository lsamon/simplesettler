# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  city_id    :integer
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_and_belongs_to_many :categories
  has_many :helpfuls
end
