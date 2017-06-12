class PriceSerializer < ActiveModel::Serializer
  attributes :id, :location, :sale, :sale_percentage, :sale_expiration, :price, :image, :confirmation_ids, :disconfirmation_ids, :user
  		def user
  			{id: object.user.id, username: object.user.username}
  		end
end
