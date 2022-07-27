class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy cancle_booking]
  after_action :update_booked_seat, only: %i[cancle_booking]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    params[:passenger_count].to_i.times do
      @booking.passenger_details.build
    end
  end

  # GET /bookings/1/edit
  def edit
  end

  def cancle_booking
    respond_to do |format|
      if @booking.update(status: "cancled")
        format.html { redirect_to booking_url, notice: "Booking was successfully Cancled." }
        format.json { render :index, status: :ok }
      end
    end
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def update_booked_seat
      @booking.flight_schedule.update(seat_booked: @booking.flight_schedule.seat_booked - @booking.passenger_details.count)
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:flight_schedule_id, :status,
        passenger_details_attributes: [:booking_id, :first_name, :last_name, :gender, :date_of_birth])
    end
end
