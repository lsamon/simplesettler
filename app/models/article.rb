class Article < ActiveRecord::Base
  mount_uploader :image, ::ArticleUploader

  belongs_to :user
  has_many :city_articles
  has_many :cities, through: :city_articles
  belongs_to :category
  has_many :helpfuls

  # has_attached_file :featured_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :featured_image, content_type: /\Aimage\/.*\z/

end
