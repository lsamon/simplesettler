class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  mount_uploader :image, ArticleUploader

  belongs_to :user
  has_many :city_articles
  has_many :cities, through: :city_articles
  belongs_to :category, counter_cache: true
  has_many :helpfuls

  enum status: { draft: 0, published: 1, unpublished: 2 }
  enum article_source: { internal: 0, external: 1 }

  validates :title, presence: true, uniqueness: true
  validates :content, :city_ids, :image, presence: true, unless: :external?
  validates :external_url, url: true, allow_blank: true, if: :external?

  def keywords
    meta_keywords.split(/[\s\,]/).select{ |p| p.present? }.join(",") if meta_keywords.present?
  end

end
