crumb :admin_root do
  link "Articles"
end

crumb :admin_articles do
  link "Articles", admin_articles_path
end

crumb :admin_article do |article|
  link article.new_record? ? "New" : "Edit"
  parent :admin_articles
end

crumb :admin_cities do
  link "Cities", admin_cities_path
end

crumb :admin_city do |city|
  link city.new_record? ? "New" : "Edit"
  parent :admin_cities
end

crumb :admin_categories do
  link "Categories", admin_categories_path
end

crumb :admin_category do |category|
  link category.new_record? ? "New" : "Edit"
  parent :admin_categories
end

crumb :admin_users do
  link "Users", admin_users_path
end

crumb :admin_user do |user|
  link user.new_record? ? "New" : "Edit"
  parent :admin_users
end

# frontend breadcrumbs

crumb :site_root do
  link "Home", root_path
end

crumb :site_city do |city|
  link "City Articles", city_path(city)
end

crumb :site_article do
  link "Article"
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
