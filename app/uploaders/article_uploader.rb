class ArticleUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  # Crop to 275px, 206px
  version :thumbnail do
    process resize_to_fill: [275, 206]
  end

  # crop to 62px, 62px
  version :mini_tumbnail do
    process resize_to_fill: [62, 62]
  end

  # crop to 870px, 261px
  version :detail do
    process resize_to_limit: [870, 261]
  end

  version :medium do
    process resize_to_limit: [600, 300]
  end

  version :large do
    process resize_to_limit: [1440, 900]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
