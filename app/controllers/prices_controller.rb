class PricesController < ApplicationController
  before_action :set_price, only: [:show, :update, :destroy, :confirm, :disconfirm]
  before_action :set_product, only: [:index,:create]
  # GET /prices
  def index
    @prices = @product.prices

    render json: @prices
  end

  # GET /prices/1
  def show
    conf_names= @price.confirmations.map{|obj| { _id: obj._id, username: obj.username}}
    disconf_names= @price.disconfirmations.map{|obj| { _id: obj._id, username: obj.username}}
    
    render json: {price: @price ,confirm:conf_names, disconfirm: disconf_names}
  end

  # POST /prices
  def create
    @price = Price.new(price_params)
    @price.product=@product
    @price.user=current_user
    if @price.save
      @product.prices.push(@price)
      render json: @price, status: :created, location: @price
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prices/1
  def update
    if @price.update(price_params)
      render json: @price
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prices/1
  def destroy
    @price.destroy
  end

  #confirm price

  def confirm
    msg = @price.confirm!(current_user)
    if msg
      render json: {error: msg}, status: :ok
    else
      render json: {message: "success"}, status: :created
    end
  end

  def disconfirm
    msg = @price.disconfirm!(current_user)

    if msg
      render json: {error: msg}, status: :ok
    else
      render json: {message: "success"}, status: :created
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a trusted parameter "white list" through.
    def price_params
      params.require(:price).permit(:location,:image,:price )
    end
end
