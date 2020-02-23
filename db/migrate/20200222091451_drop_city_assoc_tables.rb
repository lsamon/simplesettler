# frozen_string_literal: true

class DropCityAssocTables < ActiveRecord::Migration[5.1]
  def change
    drop_table(:feedbacks) if table_exists?(:feedbacks)
    drop_table(:articles) if table_exists?(:articles)
    drop_table(:city_articles) if table_exists?(:city_articles)
    drop_table(:faqs) if table_exists?(:faqs)
    drop_table(:overall_averages) if table_exists?(:overall_averages)
    drop_table(:rates) if table_exists?(:rates)
    drop_table(:rating_caches) if table_exists?(:rating_caches)
    drop_table(:articles_categories) if table_exists?(:articles_categories)
    drop_table(:average_caches) if table_exists?(:average_caches)
  end
end
