class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user, dependent: :delete, validate: false
  field :body , type: String

end