class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include ActiveModel::Validations
  field :email, type: String
  field :username, type: String
  field :password_digest, type: String
  mount_uploader :avtar, Uploader
  has_many :prices
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [ :create, :update ] }
  validates :username, presence: true
  has_secure_password  #authenticate method
end
