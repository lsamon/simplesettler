# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(admin.css admin.js payments.js ratyrate.js highcharts.js)
# Rails.application.config.assets.precompile += %w(audioplayer.js audioplayer.swf error.js error.css submissions.js simple.js devise.css site.js site.css dashboard.js dashboard.css markerclusterer.js search.js search.css)
