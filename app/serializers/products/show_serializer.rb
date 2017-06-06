class Products::ShowSerializer < ProductSerializer
	attributes :id, :name, :prices, :details
	def details
		prices = object.prices.order_by(:price => 'desc')
		{ max: prices.first.price, min: prices.last.price, min_pic: prices.last.image}
	end
end
