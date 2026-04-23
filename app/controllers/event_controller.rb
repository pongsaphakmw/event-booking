class EventController < ApplicationController
  def index
    @events = Event.all
    render json: @events
  end

  def show
    if Event.exists?(params[:id])
      @event = Event.find(params[:id])
      render json: @event
    else
      render json: { error: "Event not found" }, status: :not_found
    end
  end
end
