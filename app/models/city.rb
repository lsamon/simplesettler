class City < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :city_articles
  has_many :articles, through: :city_articles
  has_many :feedbacks, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 60 }


  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def articles_by_category(category_id)
    articles.where(category_id: category_id)
  end

end
