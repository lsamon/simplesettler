class City < ActiveRecord::Base
  has_many :city_articles
  has_many :articles, through: :city_articles
  has_many :feedbacks


  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
