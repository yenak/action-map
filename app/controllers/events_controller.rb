class EventsController < ApplicationController
    
    def event_params
        params.require(:event).permit(:name, :description, :state, :county, :start_time, :end_time)
    end
    
    def index
        @events = Event.all
        @state = params[:state]
        if @state
            @events = @events.where(state: @state)
        end
    end
    
    def new
        
    end
    
    def create
        Event.create(event_params)
        redirect_to events_path
    end
    
    def destroy
        @event = Event.find params[:id]
        Event.destroy(@event)
        redirect_to events_path
    end
    
end
