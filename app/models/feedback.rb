class Feedback < ActiveRecord::Base
  
  belongs_to :city
  belongs_to :user

  def self.check_exists(uid, feedback, cid)
    where("user_id = ? AND #{feedback} IS NOT NULL AND city_id = ?", uid, cid)
  end

  def self.per_user_city(uid, cid)
    feedback = where("user_id = ? AND city_id = ?", uid, cid)
    ratings = Hash.new(0)
    feedback.each do |f|
      ratings['liveability'] = f.liveability unless f.liveability.nil?
      ratings['movability'] = f.movability unless f.movability.nil?
      ratings['weather'] = f.weather unless f.weather.nil?
    end
    ratings
  end

  def self.average(cid, category)
   where("city_id = ?", cid).average(category).to_f
  end
end
