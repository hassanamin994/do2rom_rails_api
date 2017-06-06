class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    if @product
      render json: @product ,:serializer => Products::ShowSerializer
    else
      render json: @product, status:  :not_found
    end
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  def search
    if (params.has_key?(:seraching_word))
      @products = Product.where({qr_code: /#{params[:seraching_word]}/i},{name: /#{params[:seraching_word]}/i})
      if !@products.empty?
        @prices = []
        @products.each do  |p|
          @prices.push(Price.where({product_id: p._id}))
        end
        render json: {status:true,productsInfo:@products,productsprices:@prices}
      else
        @products = Product.any_of({name: /#{params[:seraching_word]}/i})
        #@prices = []
        #@products.each do  |p|
        #  @prices.push(Price.where({product_id: p._id}))
        #end
        render json: {status:true,productsInfo:@products}
      end
    else
      render json: {status:false,errors:"No searching words"}
    end
  end

  def searchqr
    if (params.has_key?(:seraching_word))
        @product = Product.where({qr_code: /#{params[:seraching_qr]}/})
        if !@product.empty?
          render json: {status:true,productsInfo:@product}
        else
          render json: {status:false,errors:"No product"}
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name)
      #params.fetch(:product, {})
    end
end
