class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include ActiveModel::Validations
  field :email, type: String
  field :password_digest, type: String
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [ :create, :update ] }
  has_secure_password
end
