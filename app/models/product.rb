class Product
  include Mongoid::Document
  include Mongoid::Search
  field :name, type: String
  field :qr_code, type: String
  has_many :prices
  before_create :log
  search_in :name
  protected
  def log
  	puts 'new Product'
  end
end
