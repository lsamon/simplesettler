
class Helpful < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
end
