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
        if event_params["start_time(1i)"] > event_params["end_time(1i)"]
            # end year is before start year
            flash[:date] = "Make sure end date is after start date."
            redirect_to new_event_path
            return
        elsif event_params["start_time(1i)"] == event_params["end_time(1i)"]
            # same start and end year
            if event_params["start_time(2i)"] > event_params["end_time(2i)"]
                # end month is before start month
                flash[:date] = "Make sure end date is after start date."
                redirect_to new_event_path
                return
            elsif event_params["start_time(2i)"] == event_params["end_time(2i)"]
                # same start and end month
                if event_params["start_time(3i)"] > event_params["end_time(3i)"]
                    # end day is before start day
                    flash[:date] = "Make sure end date is after start date."
                    redirect_to new_event_path
                    return
                elsif event_params["start_time(3i)"] == event_params["end_time(3i)"]
                    # same start and end day
                    if event_params["start_time(4i)"] > event_params["end_time(4i)"]
                        # end hour is before start hour
                        flash[:date] = "Make sure end date is after start date."
                        redirect_to new_event_path
                        return
                    elsif event_params["start_time(3i)"] == event_params["end_time(3i)"]
                        # same start and end hour
                        if event_params["start_time(5i)"] > event_params["end_time(5i)"]
                            # end minute is before start minute
                            flash[:date] = "Make sure end date is after start date."
                            redirect_to new_event_path
                            return
                        end
                    end
                    
                end
            end
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
