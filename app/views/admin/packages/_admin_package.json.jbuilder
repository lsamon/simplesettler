json.extract! admin_package, :id, :name, :price, :description, :status, :created_at, :updated_at
json.url admin_package_url(admin_package, format: :json)
