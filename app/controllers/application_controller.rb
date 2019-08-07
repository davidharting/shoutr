class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  # We are trying to elegantly handle unauthenticated users attempting to do things
  # We do not really want to have to check "is signed in" on every controller action
  # So we instead provide this Guest user as the signed in user
  # And make it behave appropriately.
  # Note though that we still need the before_action :require_login on controllers
  def current_user
    super || Guest.new
  end
end
