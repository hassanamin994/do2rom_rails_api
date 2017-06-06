class Products::ShowSerializer < ProductSerializer
	attributes :id, :name, :prices, :maxprices
	def maxprices
		object.prices.order_by(:price => 'desc').price.limit(1)
	end
end