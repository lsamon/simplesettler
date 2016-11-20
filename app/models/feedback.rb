# == Schema Information
#
# Table name: feedbacks
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  city_id     :integer
#  liveability :integer
#  safety      :integer
#  movability  :integer
#  weather     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Feedback < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
end
