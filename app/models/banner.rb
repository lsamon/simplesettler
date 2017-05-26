class Banner < ActiveRecord::Base
  mount_uploader :media, ArticleUploader
end
