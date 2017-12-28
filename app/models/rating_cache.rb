class RatingCache < ActiveRecord::Base
  belongs_to :cacheable, :polymorphic => true

  def self.rateable_obj_dimensions_avg_list(rateable_obj_id)
    all_data = []
    data = where(cacheable_id: rateable_obj_id).pluck(:dimension.to_s.titleize, :avg)
    categories = data.map{ |c| c[0].titleize }
    series = data.map{ |s| s[1] }
    colors = data.map do |rating|
      case
      when rating[1] >= 4 then '#2bde73'
      when rating[1] >= 2.5 then '#ffc924'
      else
        '#ff4742'
      end
    end
    all_data = [categories] + [series] + [colors]
  end
end
