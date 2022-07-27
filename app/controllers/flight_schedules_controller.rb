class FlightSchedulesController < ApplicationController
  before_action :set_flight_schedule, only: %i[ show edit update destroy ]

  # GET /flight_schedules or /flight_schedules.json
  def index
    if params[:departure_airport_id].present? && params[:destination_airport_id].present?
      @flight_schedules = FlightSchedule.search_by_params(params).order(:date)
    else
      @flight_schedules = FlightSchedule.all
    end
  end

  # GET /flight_schedules/1 or /flight_schedules/1.json
  def show
    confirmed_booking_ids = @flight_schedule.bookings.confirmed?.pluck(:id)
    @total_men_passenger = PassengerDetail.where(gender: "Male", booking_id: confirmed_booking_ids).count
    @total_women_passenger = PassengerDetail.where(gender: "Female", booking_id: confirmed_booking_ids).count
  end

  # GET /flight_schedules/new
  def new
    @flight_schedule = FlightSchedule.new
  end

  # GET /flight_schedules/1/edit
  def edit
  end

  # POST /flight_schedules or /flight_schedules.json
  def create
    @flight_schedule = FlightSchedule.new(flight_schedule_params)

    respond_to do |format|
      if @flight_schedule.save
        format.html { redirect_to flight_schedule_url(@flight_schedule), notice: "Flight schedule was successfully created." }
        format.json { render :show, status: :created, location: @flight_schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flight_schedules/1 or /flight_schedules/1.json
  def update
    respond_to do |format|
      if @flight_schedule.update(flight_schedule_params)
        format.html { redirect_to flight_schedule_url(@flight_schedule), notice: "Flight schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @flight_schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flight_schedules/1 or /flight_schedules/1.json
  def destroy
    @flight_schedule.destroy

    respond_to do |format|
      format.html { redirect_to flight_schedules_url, notice: "Flight schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight_schedule
      @flight_schedule = FlightSchedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_schedule_params
      params.require(:flight_schedule).permit(:flight_id, :departure_airport_id, :destination_airport_id, :date, :price)
    end
end
