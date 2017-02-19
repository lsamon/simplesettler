class Article < ActiveRecord::Base
  belongs_to :user
  has_many :city_articles
  has_many :cities, through: :city_articles
  belongs_to :category
  has_many :helpfuls

  has_attached_file :featured_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :featured_image, content_type: /\Aimage\/.*\z/

  def self.by_city_and_category(cid, cat_id)
    where(:category_id => cat_id).first.cities.where(:id => cid)
  end

end
