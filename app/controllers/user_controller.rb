class UserController < ApplicationController
  # after_action :verify_authorized, :except => :index, unless: :devise_controller?

  def index
    policy_scope(User) #miscreant
    @dont_render_footer = true
  end
end
