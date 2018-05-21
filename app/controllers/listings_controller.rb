class ListingsController < ApplicationController
  def index
    #INDEX
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
end
