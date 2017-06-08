class Product
  include Mongoid::Document
  include Mongoid::Search
  field :name, type: String
  field :qr_code, type: String
  has_many :prices
  has_many :comments
  search_in :name
  validates :name, uniqueness: true
  validates :qr_code, uniqueness: true
end
