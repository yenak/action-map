class EventsController < ApplicationController
    
    def event_params
        params.require(:event).permit(:name, :description, :state, :county, :start_time, :end_time)
    end
    
    def index
        @events = Event.all
    end
    
    def new
        
    end
    
    def create
        Event.create(event_params)
        redirect_to events_path
    end
    
end
