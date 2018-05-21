class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    #INDEX
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  # TODO - determine if booking should be instantiated here and called in to show method

  def set_booking
    @booking = Booking.new
  end

end
