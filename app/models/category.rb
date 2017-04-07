class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :articles, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 60 }
end
