class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    #INDEX
    @listings = policy_scope(Listing).all # ????? -> wtf is this for
    # @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    authorize @listing

    if @listing.save
      redirect_to listing_path(@listing.id)
    else
      render :new
    end
  end

  def update
    authorize @listing
  end

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def destroy
    authorize @listing
  end

  private

  # TODO - determine if booking should be instantiated here and called in to show method

  def listing_params
    params.require(:listing).permit(:description, :cuisine, :min_party_size, :max_party_size, :price_per_person, :user_id, :lng, :lat, :photo)
  end

  def set_booking
    @booking = Booking.new
  end

end
