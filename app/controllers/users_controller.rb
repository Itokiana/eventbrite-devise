class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    if params[:id]
      @user = User.find(params[:id])
      @event_attended = EventAttendee.where(attendee_id: params['id'])
      @events = []
      if @event_attended != []
        @event_attended.each do |e|
          @events.push(Event.find(e.event_id))
        end
      end
    else
      redirect_to new_event_path
    end

    event_attending = EventAttendee.where(attendee_id: params[:id])
    @attendees = []
    if event_attending != []
      event_attending.each do |a|
        @attendees.push(User.find(a.attendee_id))
      end
    end
  end
end
