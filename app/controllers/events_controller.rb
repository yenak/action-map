class EventsController < ApplicationController
    
    def event_params
        params.require(:event).permit(:name, :state, :county, :description, :start_time, :end_time)
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
        if params[:state] == ""
            flash[:state] = "Please choose a state."
            redirect_to new_event_path
            return
        end
        @start_date = Time.new(event_params["start_time(1i)"].to_i, event_params["start_time(2i)"].to_i, event_params["start_time(3i)"], event_params["start_time(4i)"].to_i, event_params["start_time(5i)"].to_i)
        @end_date = Time.new(event_params["end_time(1i)"].to_i, event_params["end_time(2i)"].to_i, event_params["end_time(3i)"], event_params["end_time(4i)"].to_i, event_params["end_time(5i)"].to_i)
        puts @start_date
        puts @end_date
        if @start_date > @end_date
            flash[:date] = "Make sure end date is after start date."
            redirect_to new_event_path
            return
        end
        params.require(:state)
        @params = event_params.merge(:state => params[:state])
        Event.create(@params)
        redirect_to events_path
    end
    
    def destroy
        @event = Event.find params[:id]
        Event.destroy(@event)
        redirect_to events_path
    end
    
end
