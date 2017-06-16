class Image
  include Mongoid::Document
  mount_base64_uploader :image, AvatarUploader, file_name: -> (i) { i.id }
  embedded_in :Product
end