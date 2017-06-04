class Package < ActiveRecord::Base
  enum status: { draft: 0, published: 1, unpublished: 2 }
  has_many :payments
  before_save :increment_id, if: :new_record?

  private
  def increment_id
    self.id = Package.last.id + 1
  end
end
