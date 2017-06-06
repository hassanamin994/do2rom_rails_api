class Product
  include Mongoid::Document
  include Mongoid::Search
  field :name, type: String
  has_many :prices
  search_in :name
  validates :name, uniqueness: true
end
