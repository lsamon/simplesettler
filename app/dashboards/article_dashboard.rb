require "administrate/base_dashboard"

class ArticleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    city_articles: Field::HasMany,
    cities: Field::HasMany,
    category: Field::BelongsTo,
    helpfuls: Field::HasMany,
    id: Field::Number,
    city_id: Field::Number,
    title: Field::String,
    content: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image: Field::String,
    featured_image_file_name: Field::String,
    featured_image_content_type: Field::String,
    featured_image_file_size: Field::Number,
    featured_image_updated_at: Field::DateTime,
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
    :user,
    :city_articles,
    :cities,
    :category,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :city_articles,
    :cities,
    :category,
    :helpfuls,
    :id,
    :city_id,
    :title,
    :content,
    :created_at,
    :updated_at,
    :image,
    :featured_image_file_name,
    :featured_image_content_type,
    :featured_image_file_size,
    :featured_image_updated_at,
    :slug,
    :meta_title,
    :meta_description,
    :meta_keywords,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :city_articles,
    :cities,
    :category,
    :helpfuls,
    :city_id,
    :title,
    :content,
    :image,
    :featured_image_file_name,
    :featured_image_content_type,
    :featured_image_file_size,
    :featured_image_updated_at,
    :slug,
    :meta_title,
    :meta_description,
    :meta_keywords,
  ].freeze

  # Overwrite this method to customize how articles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(article)
  #   "Article ##{article.id}"
  # end
end
