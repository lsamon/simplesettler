class VisaType < ActiveRecord::Base
  has_many :visa_requirements, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 60 }
end
