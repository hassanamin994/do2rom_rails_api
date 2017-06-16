class Products::ShowSerializer < ProductSerializer
	attributes :id, :name, :qr_code, :details, :images
	class CustomPriceSerializer < PriceSerializer
		attributes :id, :location, :sale, :sale_percentage, :sale_expiration, :price, :confirmation_ids, :disconfirmation_ids, :user, :created_at
  		def user
  			{id: object.user.id, username: object.user.username}
  		end
  	end

  	class CustomCommentSerializer < CommentSerializer
  		attributes :id, :body ,:user
  		def user
  			{id: object.user.id, username: object.user.username}
  		end
  	end

  def details
    if object.prices.exists?
      prices = object.prices.order_by(:price => 'desc')
      { max: prices.first.price, max_id: prices.first.id.to_s, min: prices.last.price, min_id: prices.last.id, 
        min_username: prices.last.user.username, min_userid: prices.last.user.id.to_s, 
        min_location: prices.last.location, min_sale: prices.last.sale, 
        min_sale_percentage: prices.last.sale_percentage, min_sale_expiration: prices.last.sale_expiration, 
        min_confirmations:prices.last.confirmation_ids, 
        min_disconfirmations:prices.last.disconfirmation_ids}
    else
      nil
    end
  end
  
  has_many :comments, serializer: CustomCommentSerializer

 	has_many :prices, serializer: CustomPriceSerializer

end
