class ShmaddressesController < ApplicationController
  before_action :set_shmaddress, only: [:show, :update, :destroy]

  # GET /shmaddresses
  def index
    @shmaddresses = Shmaddress.all

    render json: @shmaddresses
  end

  # GET /shmaddresses/1
  def show
    render json: @shmaddress
  end

  # POST /shmaddresses
  def create
    @shmaddress = Shmaddress.new(shmaddress_params)

    result = Braintree::MerchantAccount.create(
      :individual => {
        :first_name => "Jane",
        :last_name => "Doe",
        :email => "jane@14ladders.com",
        :phone => "5553334444",
        :date_of_birth => "1981-11-19",
        :ssn => "456-45-4567",
        :address => {
          :street_address => "111 Main St",
          :locality => "Chicago",
          :region => "IL",
          :postal_code => "60622"
        }
      },
      :funding => {
        :descriptor => "Blue Ladders",
        :destination => Braintree::MerchantAccount::FundingDestination::Bank,
        :email => "funding@blueladders.com",
        :mobile_phone => "5555555555",
        :account_number => "1123581321",
        :routing_number => "071101307"
      },
      :tos_accepted => true,
      :master_merchant_account_id => "shmealllc",
      :id => "walter_white"
      )

    if @shmaddress.save
      render json: @shmaddress, status: :created, location: @shmaddress
    else
      render json: @shmaddress.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shmaddresses/1
  def update
    if @shmaddress.update(shmaddress_params)
      render json: @shmaddress
    else
      render json: @shmaddress.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shmaddresses/1
  def destroy
    @shmaddress.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shmaddress
      @shmaddress = Shmaddress.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shmaddress_params
      params.require(:shmaddress).permit(:firstName, :lastName, :streetAddress, :streetAddress2, :locality, :postalCode, :region, :addressDate, :userID)
    end
end
