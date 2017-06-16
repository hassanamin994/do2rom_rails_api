class Image
  include Mongoid::Document
  include Rails.application.routes.url_helpers
  mount_base64_uploader :image, AvatarUploader, file_name: -> (i) { i.id }
  field :ss, type: String
  embedded_in :Product
end