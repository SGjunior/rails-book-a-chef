class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    #INDEX
    @listings = policy_scope(Listing).all # ????? -> wtf is this for
    # @listings = Listing.all

    @listings_on_map = Listing.where.not(latitude: nil, longitude: nil)

    @markers = @listings_on_map.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        # infoWindow: { content: 'you are here' }
        infoWindow: { content: render_to_string(partial: "listings/listing_marker", locals: { listing: listing }) }
      }
    end


  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing

    @markers = [{
      lat: @listing.latitude,
      lng: @listing.longitude
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
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)

    authorize @listing
    redirect_to user_dashboard_path
  end

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    authorize @listing

    begin
      @listing.destroy
      respond_to do |format|
        format.html { redirect_to user_dashboard_path }
        format.js  # <-- will render `app/views/listings/destroy.js.erb`
      end
    rescue => e
      if e.to_s =~ /violates foreign key constraint/
        @error = 'Your listing still has active bookings'
      else
        @error = 'Error code 663 : Please contact support'
      end
      # binding.pry
      respond_to do |format|
        format.html { render 'restaurants/show' }
        format.js # <-- will render `app/views/listings/destroy.js.erb`
      end
    end
  end

  private

  # TODO - determine if booking should be instantiated here and called in to show method

  def listing_params
    params.require(:listing).permit(:description, :cuisine, :min_party_size, :max_party_size, :price_per_person, :user_id, :longitude, :latitude, :photo, :address)
  end

  def set_booking
    @booking = Booking.new
  end

end
