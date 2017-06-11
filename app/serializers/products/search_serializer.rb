class Products::SearchSerializer < ProductSerializer
	attributes :id, :name, :qr_code, :details
	def details
		if object.prices.exists?
			prices = object.prices.order_by(:price => 'desc')
			{ max: prices.first.price, min: prices.last.price, min_pic: prices.last.image, min_uername: prices.last.user.username, min_userid: prices.last.user.id, min_confirmations:prices.last.confirmation_ids, min_disconfirmations:prices.last.disconfirmation_ids}
		else
			nil
		end
	end
end