class Products::ShowSerializer < ProductSerializer
	attributes :id, :name, :comments, :qr_code
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

 	has_many :prices, serializer: CustomPriceSerializer

end
