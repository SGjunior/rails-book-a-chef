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
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save!
      redirect_to listing_path(@listing.id)
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  # TODO - determine if booking should be instantiated here and called in to show method

  def listing_params
    params.require(:listing).permit(:description, :cuisine, :min_party_size, :max_party_size, :price_per_person, :user_id, :lng, :lat)
  end

  def set_booking
    @booking = Booking.new
  end

end
