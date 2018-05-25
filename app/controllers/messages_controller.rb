class MessagesController < ApplicationController
  def create
    #do something
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.booking_id = params[:booking_id]
    authorize @message

    # raise
    if @message.save

    else
      # we done son
    end
    if @message.save
      respond_to do |format|
        format.html { redirect_to user_dashboard_path }
        format.js  # <-- will render `app/views/listings/destroy.js.erb`
      end
    else
      respond_to do |format|
        # format.html { render 'restaurants/show' }
        format.js # <-- will render `app/views/listings/destroy.js.erb`
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
    # params
  end

end
