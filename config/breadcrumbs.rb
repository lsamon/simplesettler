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

crumb :admin_visa_types do
  link "Visa Types", admin_visa_types_path
end

crumb :admin_visa_type do |visa|
  link visa.new_record? ? "New" : "Edit"
  parent :admin_visa_types
end


crumb :admin_visa_details do |visa|
  link "Visa type details", admin_visa_type_path(visa)
  parent :admin_visa_types
end

crumb :admin_visa_requirement do |visa_requirement, visa_type|
  link visa_requirement.new_record? ? "New requirement" : "Edit requirement"
  parent :admin_visa_details, visa_type
end

# crumb :admin_visa_type do |visa|
#   link visa.new_record? ? "New" : "Edit"
#   parent :admin_visa_types
# end

crumb :admin_payments do |payment|
  link "Payment lists", admin_payments_path
end

crumb :admin_payment_show do |payment|
  link "Details"
  parent :admin_payments
end

crumb :admin_packages do
  link "Packages", admin_packages_path
end

crumb :admin_package do |package|
  link package.new_record? ? "New" : "Edit"
  parent :admin_packages
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
