class Product
  include Mongoid::Document
  field :name, type: String
  has_many :prices #,autosave: true
  before_create :log

  protected
  def log
  	puts 'new Product'
  end
end
