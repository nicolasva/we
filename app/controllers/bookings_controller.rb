class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "Booking was successfully created."
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def new
    @booking = Booking.new
    @booking.booking_prestations.build
  end

  def show
    @booking = Booking.find(params[:id])
    @pros = Pro.all
  end

  def index
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking)
          .permit(:name,
                  :email,
                  :address,
                  :lat,
                  :lng,
                  :starts_at,
                  booking_prestations_attributes: %i[id booking_id prestation_id])
  end
end
