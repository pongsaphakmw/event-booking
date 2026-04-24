class BookingController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      user = User.find(booking_params[:user_id])
      event = Event.lock.find(booking_params[:event_id])
      quantity = booking_params[:quantity]

      if event.remaining_tickets < quantity
        return render json: { error: "Not enough tickets" }
      end

      now = Time.current
      tickets_attrs = Array.new(quantity) do
        { event_id: event.id, user_id: booking_params[:user_id], created_at: now, updated_at: now }
      end

      result = Ticket.insert_all!(tickets_attrs, returning: %w[id])
      event.decrement!(:remaining_tickets, quantity)

      tickets = Ticket.where(id: result.rows.flatten)
      render json: tickets, status: :created
    end
  end

  private

  def booking_params
    params.permit(:event_id, :user_id, :quantity)
  end
end
