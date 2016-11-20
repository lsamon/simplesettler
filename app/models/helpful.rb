# == Schema Information
#
# Table name: helpfuls
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  helped     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Helpful < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
end
