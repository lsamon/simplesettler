class Article < ActiveRecord::Base
  mount_uploader :image, ArticleUploader

  belongs_to :user
  has_many :city_articles
  has_many :cities, through: :city_articles
  belongs_to :category, counter_cache: true
  has_many :helpfuls

  enum status: { draft: 0, published: 1, unpublished: 2 }

  validates :title, presence: true, uniqueness: true, length: { maximum: 60 }
  validates :content, :city_ids, presence: true

end
