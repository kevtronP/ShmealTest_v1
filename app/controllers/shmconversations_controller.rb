class ShmconversationsController < ApplicationController
  before_action :set_shmconversation, only: [:show, :update, :destroy]

  # GET /shmconversations
  def index
    @shmconversations = Shmconversation.all

    render json: @shmconversations
  end

  # GET /shmconversations/1
  def show
    @shmconversation = Shmconversation.find(params[:id])
    @shmorders = @shmconversation.shmorders
    render json: @shmconversation
  end

  # POST /shmconversations
  def create
    @shmconversation = Shmconversation.new(shmconversation_params)

    @shmconversation.shmcook_id = @shmconversation.originalCookID;
    @shmconversation.user_id = @shmconversation.originalEaterID;

    if @shmconversation.save
      render json: @shmconversation, status: :created, location: @shmconversation
    else
      render json: @shmconversation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmconversations/1
  def update
    if @shmconversation.update(shmconversation_params)
      render json: @shmconversation
    else
      render json: @shmconversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmconversations/1
  def destroy
    @shmconversation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmconversation
      @shmconversation = Shmconversation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmconversation_params
      params.require(:shmconversation).permit(:convChannel, :originalCookID, :originalEaterID, :convStartDate, :origCookCheckInDate, :origEaterCheckInDate, :lastMessageDate)
    end
end
