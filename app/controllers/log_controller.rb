class LogController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order(created_at: :desc)
  end
end
