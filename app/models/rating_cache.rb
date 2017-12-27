class RatingCache < ActiveRecord::Base
  belongs_to :cacheable, :polymorphic => true

  def self.rateable_obj_dimensions_avg_list(rateable_obj_id)
    where(cacheable_id: rateable_obj_id).pluck(:dimension.to_s.titleize, :avg)
  end
end
