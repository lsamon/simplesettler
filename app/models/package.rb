class Package < ActiveRecord::Base

  enum status: { draft: 0, published: 1, unpublished: 2 }
end
