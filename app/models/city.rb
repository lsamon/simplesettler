class City < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :city_articles
  has_many :articles, through: :city_articles
  has_many :feedbacks


  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def self.articles_by_category(cid, cat_name)
    cat_id = Category.where(:name => cat_name).first.id
    where(:id => cid).first.articles.where(:category_id => cat_id)
  end

end
