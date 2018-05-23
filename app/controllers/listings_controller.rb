class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    #INDEX
    @listings = policy_scope(Listing).all # ????? -> wtf is this for
    # @listings = Listing.all

    @listings_on_map = Listing.where.not(lat: nil, lng: nil)

    @markers = @listings_on_map.map do |listing|
      {
        lat: listing.lat,
        lng: listing.lng,
        # infoWindow: { content: 'you are here' }
        infoWindow: { content: render_to_string(partial: "listings/listing_marker", locals: { listing: listing }) }
      }
    end


  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing

    @markers = [{
      lat: @listing.lat,
      lng: @listing.lng
    }]
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    authorize @listing

    if @listing.save
      redirect_to user_dashboard_path
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
    @listing = Listing.find(params[:id])
    authorize @listing
    @listing.delete
    redirect_to user_dashboard_path
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
