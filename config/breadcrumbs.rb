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
