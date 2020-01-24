class BookingsController < ApplicationController
  before_action :set_listing, :set_user

  def index
    @bookings = policy_scope(Booking).all
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.user = @user
    if @booking.save!
      # redirect_to root_path
      redirect_to listing_path(@booking.listing.id)
    else
      render "new"
    end
    authorize @booking

  end

  def destroy
    authorize @booking
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:listing_id, :user_id, :reservation_date, :reservation_time, :guests_count)
  end
end
