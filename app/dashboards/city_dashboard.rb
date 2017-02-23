require "administrate/base_dashboard"

class CityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    city_articles: Field::HasMany,
    articles: Field::HasMany,
    feedbacks: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    country: Field::String,
    description: Field::Text,
    population: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slogan: Field::String,
    slug: Field::String,
    meta_title: Field::String,
    meta_description: Field::Text,
    meta_keywords: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :city_articles,
    :articles,
    :feedbacks,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :city_articles,
    :articles,
    :feedbacks,
    :id,
    :name,
    :country,
    :description,
    :population,
    :created_at,
    :updated_at,
    :slogan,
    :slug,
    :meta_title,
    :meta_description,
    :meta_keywords,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :city_articles,
    :articles,
    :feedbacks,
    :name,
    :country,
    :description,
    :population,
    :slogan,
    :slug,
    :meta_title,
    :meta_description,
    :meta_keywords,
  ].freeze

  # Overwrite this method to customize how cities are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(city)
  #   "City ##{city.id}"
  # end
end
