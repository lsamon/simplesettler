class Article < ActiveRecord::Base
  mount_uploader :image, ::ArticleUploader

  belongs_to :user
  has_many :city_articles
  has_many :cities, through: :city_articles
  belongs_to :category
  has_many :helpfuls

  enum status: { draft: 0, published: 1, unpublished: 2 }

  validates :title, :content, presence: true

end
