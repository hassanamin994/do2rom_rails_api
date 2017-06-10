  class UsersController < ApiController
  before_action :authenticate_user, except: [:create]
  before_action :set_user, only: [:show, :update, :destroy, :avatar]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def my_info
    render json: current_user
  end

  # POST /users
  def create
    if User.find_by(email: user_params["email"])
      render json: {message: "user already exist"} , status: :ok
    else
      @user = User.new(user_params)

      if @user.save
        render json: {message: "registration complete"}, status: :created, location: @user
      else
        render json: {error: @user.errors}, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: {error: @user.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /users/id
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username , :email ,:password,:password_confirmation, :avatar)
      
    end
end
