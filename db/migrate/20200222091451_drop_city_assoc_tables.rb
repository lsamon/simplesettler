# frozen_string_literal: true

class DropCityAssocTables < ActiveRecord::Migration[5.1]
  def change
    drop_table(:feedbacks)
    drop_table(:articles)
    drop_table(:city_articles)
    drop_table(:faqs)
    drop_table(:overall_averages)
    drop_table(:rates)
    drop_table(:rating_caches)
    drop_table(:articles_categories)
    drop_table(:average_caches)
  end
end
