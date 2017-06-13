class Product
  include Mongoid::Document
  include Mongoid::Search
  include Rails.application.routes.url_helpers	
  field :name, type: String
  field :qr_code, type: String
  has_many :prices
  has_many :comments
  search_in :name
  mount_base64_uploader :image, AvatarUploader, file_name: -> (p) { p.id }
  validates :name, uniqueness: true
  validates :qr_code, uniqueness: true ,if: :qr_code
end
