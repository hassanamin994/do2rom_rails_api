class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body ,:user, :product_id
  		def user
  			{id: object.user.id, username: object.user.username}
  		end
end