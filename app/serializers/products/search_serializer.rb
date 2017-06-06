class Products::SearchSerializer < ProductSerializer
	attributes :id, :name, :details
	def details
		prices = object.prices.order_by(:price => 'desc')
		{ max: prices.first, min: prices.last.price, min_pic: prices.last.image}
	end
end