class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])

    #@cooks = Shmcook.where(:userID => @user.id)

    #@menuitems = Menuitem.where(:userID => @user.id)

    #@user.menuitems = @menuitems
    @menuitems = @user.menuitems
    @shmaddresses = @user.shmaddresses
    @shmconversations = @user.shmconversations
    #@user.shmcooks = @shmcooks
    @shmcustomerpmtmethods = @user.shmcustomerpmtmethods
    @shmfundings = @user.shmfundings
    @shmuserattributes = @user.shmuserattributes
    @shmuserstatuses = @user.shmuserstatuses

    render json: @user

  end

  # POST /users
  def create
    @user = User.new(user_params)

    @user.freeShmeals = 1;

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
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
      params.require(:user).permit(:userEmail, :userPhoneNumber, :userName, :lastName, :userDate, :freeShmeals, menuitems: [:mealName, :userID, :menuItemDate])
    end
end
