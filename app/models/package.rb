class Package < ActiveRecord::Base
  enum status: { draft: 0, published: 1, unpublished: 2 }
  has_many :payments

  validates :name, :price, presence: true
end
