class PassengerDetailsController < ApplicationController
  before_action :set_passenger_detail, only: %i[ show edit update destroy ]

  # GET /passenger_details or /passenger_details.json
  def index
    @passenger_details = PassengerDetail.all
  end

  # GET /passenger_details/1 or /passenger_details/1.json
  def show
  end

  # GET /passenger_details/new
  def new
    @passenger_detail = PassengerDetail.new
  end

  # GET /passenger_details/1/edit
  def edit
  end

  # POST /passenger_details or /passenger_details.json
  def create
    @passenger_detail = PassengerDetail.new(passenger_detail_params)

    respond_to do |format|
      if @passenger_detail.save
        format.html { redirect_to passenger_detail_url(@passenger_detail), notice: "Passenger detail was successfully created." }
        format.json { render :show, status: :created, location: @passenger_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @passenger_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passenger_details/1 or /passenger_details/1.json
  def update
    respond_to do |format|
      if @passenger_detail.update(passenger_detail_params)
        format.html { redirect_to passenger_detail_url(@passenger_detail), notice: "Passenger detail was successfully updated." }
        format.json { render :show, status: :ok, location: @passenger_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @passenger_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passenger_details/1 or /passenger_details/1.json
  def destroy
    @passenger_detail.destroy

    respond_to do |format|
      format.html { redirect_to passenger_details_url, notice: "Passenger detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger_detail
      @passenger_detail = PassengerDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passenger_detail_params
      params.require(:passenger_detail).permit(:booking_id, :first_name, :last_name, :gender, :date_of_birth)
    end
end
