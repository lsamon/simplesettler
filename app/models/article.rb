class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  mount_uploader :image, ImageUploader

  enum content_type: { article: 0, about: 1 }

  belongs_to :user
  has_many :city_articles
  has_many :cities, through: :city_articles
  belongs_to :category, counter_cache: true

  enum status: { draft: 0, published: 1, unpublished: 2 }

  before_save :nullify_unwanted_fields
  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :content, presence: true

  def keywords
    meta_keywords.split(/[\s\,]/).select{ |p| p.present? }.join(",") if meta_keywords.present?
  end

  def self.about_us
    where(content_type: 'about').first
  end

  private
  def nullify_unwanted_fields
    if about?
      self.category = nil
      self.cities = []
    end
  end

end
