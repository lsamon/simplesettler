# frozen_string_literal: true

class City < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
