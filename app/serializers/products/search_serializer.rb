class Products::SearchSerializer < ProductSerializer
	attributes :id, :name, :prices, :maxprices
	def maxprices
		object.prices.order_by(:price => 'desc').limit(1)
	end
end