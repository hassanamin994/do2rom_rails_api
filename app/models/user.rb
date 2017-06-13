class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include ActiveModel::Validations
  include Rails.application.routes.url_helpers
  field :email, type: String
  field :username, type: String
  field :password_digest, type: String
  field :points , type: Integer
  field :fakes , type: Integer
  field :flage , type: Integer
  mount_base64_uploader :avatar, AvatarUploader, file_name: -> (u) { u.id }
  has_many :prices, inverse_of: :user
  has_and_belongs_to_many :confirms, class_name: "Price", inverse_of: :confirmations
  has_and_belongs_to_many :disconfirms, class_name: "Price", inverse_of: :disconfirmations
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [ :create, :update ] }
  validates :username, presence: true
  has_secure_password 

  def points
    y = self.confirms.count + self.disconfirms.count
    x = self.prices.count * 4
    (x+y)*5
  end
end