class TicketController < ApplicationController
  def index
    user = User.find(params[:id])
    render json: user.tickets
  end

  def show
    user = User.find(params[:id])
    ticket = user.tickets.find(params[:ticket_id])
    render json: ticket
  end
end
