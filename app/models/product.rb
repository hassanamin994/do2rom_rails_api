class Product
  include Mongoid::Document
  field :name, type: String
  has_many :prices
end
