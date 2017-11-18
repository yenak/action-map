class MapController < ApplicationController
  def index
    @states = State.all
    @map = params[:map]
    @states.each do |state|
      if @map == "immigration_activity"
        state.activity = state.immigration_activity
      elsif @map == "gun_control_activity"
        state.activity = state.gun_control_activity
      elsif @map == "environment_activity"
        state.activity = state.environment_activity
      end
    end
        
  end

  def state
    @counties = {}
    states_id = State.where(symbol: params[:state]).first.id
    County.where(states_id: states_id).each do |county|
      @counties[county.name] = county.activity
      if @map == "immigration_activity"
        county.activity = county.immigration_activity
      elsif @map == "gun_control_activity"
        county.activity = county.gun_control_activity
      elsif @map == "environment_activity"
        county.activity = county.environment_activity
      end
    end
    render "map/#{params[:state].downcase}"
  end
end
