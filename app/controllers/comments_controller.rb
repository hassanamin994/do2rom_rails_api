class CommentsController < ApiController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_product, only: [:index,:create]
  # GET /comments
  def index
    @comments = @product.comments

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.product=@product
    @comment.user=current_user 
    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.fetch(:comment, {})
      params.require(:comment).permit(:body )
    end
end
