class Products::SearchSerializer < ProductSerializer
	attributes :id, :name, :details
	def details
		if object.prices.exists?
			prices = object.prices.order_by(:price => 'desc')
			{ max: prices.first, min: prices.last.price, min_pic: prices.last.image}
		else
			nil
		end
	end
end