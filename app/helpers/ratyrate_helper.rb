module RatyrateHelper
  def rating_for(rateable_obj, dimension=nil, options={})

    cached_average = rateable_obj.average dimension
    avg = cached_average ? cached_average.avg : 0

    number_of_stars = options[:number_of_stars] || 5
    star_half       = options[:half_show]       || true
    precision       = options[:precision]       || 1
    spacing         = options[:space]           || '0px'
    star_width      = options[:star_width]      || '26px'
    readOnly        = options[:readonly]        || 'false'
    rated_fill      = options[:ratedFill]       || ''
    rating          = options[:rating]          || ''

    disable_after_rate = options[:disable_after_rate] && true
    disable_after_rate = true if disable_after_rate == nil

    unless readOnly
      if disable_after_rate
        readOnly = !(current_user && rateable_obj.can_rate?(current_user, dimension))
      # else
      #   readOnly = !current_user || false
      end
    end

    content_tag :div, '', "data-dimension" => dimension, :class => "star", "data-rating" => avg,
                "data-id" => rateable_obj.id, "data-classname" => rateable_obj.class.name == rateable_obj.class.base_class.name ? rateable_obj.class.name : rateable_obj.class.base_class.name,
                "data-rateyo-num-stars" => number_of_stars,
                "data-disable-after-rate" => disable_after_rate,
                "data-rateyo-read-only" => readOnly,
                "data-rateyo-half-star" => star_half,
                "data-rateyo-precision" => precision,
                "data-rateyo-spacing" => spacing,
                "data-rateyo-star-width" => star_width,
                "data-rateyo-rated-fill" => rated_fill,
                "data-rateyo-rating" => rating
  end

  def rating_for_user(rateable_obj, rating_user, dimension = nil, options = {})
    @object = rateable_obj
    @user   = rating_user
	  @rating = Rate.find_by rater: @user, rateable: @object, dimension: dimension
	  stars = @rating ? @rating.stars : 0

    number_of_stars = options[:number_of_stars] || 5
    star_half       = options[:half_show]       || true
    precision       = options[:precision]       || 1
    spacing         = options[:space]           || '0px'
    star_width      = options[:star_width]      || '18px'
    readOnly        = options[:readonly]        || false
    rated_fill      = options[:ratedFill]       || ''
    rating          = options[:rating]          || 0


    disable_after_rate = options[:disable_after_rate] || false

    if disable_after_rate
      readOnly = rating_user.present? ? !rateable_obj.can_rate?(rating_user, dimension) : true
    end

    content_tag :div, '', "data-dimension" => dimension, :class => "star", "data-rating" => stars,
                "data-id" => rateable_obj.id, "data-classname" => rateable_obj.class.name == rateable_obj.class.base_class.name ? rateable_obj.class.name : rateable_obj.class.base_class.name,
                "data-rateyo-num-stars" => number_of_stars,
                "data-disable-after-rate" => disable_after_rate,
                "data-rateyo-read-only" => readOnly,
                "data-rateyo-half-star" => star_half,
                "data-rateyo-precision" => precision,
                "data-rateyo-spacing" => spacing,
                "data-rateyo-star-width" => star_width,
                "data-rateyo-rated-fill" => rated_fill,
                "data-rateyo-rating" => rating
  end
end
