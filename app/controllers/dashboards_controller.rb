# Authenticated home screen
class DashboardsController < ApplicationController
  def show
    @timeline = Timeline.new(current_user)
  end
end
