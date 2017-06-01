class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :city_articles
  has_many :cities, through: :city_articles
  belongs_to :category, counter_cache: true
  has_many :helpfuls

  enum status: { draft: 0, published: 1, unpublished: 2 }

  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }
  # validates :content, :city_ids, presence: true
  validates :content, presence: true

  def keywords
    meta_keywords.split(/[\s\,]/).select{ |p| p.present? }.join(",") if meta_keywords.present?
  end

end
