class Product
  include Mongoid::Document
  include Mongoid::Search
  include Rails.application.routes.url_helpers	
  field :name, type: String
  field :qr_code, type: String
  has_many :prices
  has_many :comments
  embeds_many :images, class_name: "Image"
  search_in :name
  validates :name, uniqueness: true
  validates :qr_code, uniqueness: true ,if: :qr_code
end
