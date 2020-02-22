# frozen_string_literal: true

crumb :admin_cities do
  link "Cities", admin_cities_path
end

crumb :admin_city do |city|
  link city.new_record? ? "New" : "Edit"
  parent :admin_cities
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

crumb :admin_payments do |_|
  link "Payment lists", admin_payments_path
end

crumb :admin_payment_show do |_|
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
