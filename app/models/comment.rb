class Comment
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include ActiveModel::Validations
  belongs_to :user, dependent: :delete, validate: false
  field :body , type: String

end