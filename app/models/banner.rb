class Banner < ActiveRecord::Base
  mount_uploader :media, ImageUploader
end
