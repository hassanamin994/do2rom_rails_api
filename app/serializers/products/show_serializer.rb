class Products::ShowSerializer < ProductSerializer
	attributes :id, :name, :qr_code
	class CustomPriceSerializer < PriceSerializer
		attributes :id, :location, :sale, :sale_percentage, :sale_expiration, :price, :image, :confirmations, :disconfirmations, :user
  		def user
  			{id: object.user.id, username: object.user.username}
  		end
  		def confirmations
  			user
  		end
  		def disconfirmations
  			user
  		end
  	end

  	class CustomCommentSerializer < CommentSerializer
  		attributes :id, :body ,:user
  		def user
  			{id: object.user.id, username: object.user.username}
  		end
  	end

  	has_many :comments, serializer: CustomCommentSerializer

 	has_many :prices, serializer: CustomPriceSerializer

end
