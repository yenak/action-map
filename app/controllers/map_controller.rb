class MapController < ApplicationController
  def index
    @states = State.all
    @map = params[:map] || ""
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
    @map = params[:map]||""
    County.where(states_id: states_id).each do |county|
      @counties[county.name] = county.activity
      if @map == "immigration_activity"
        @counties[county.name] = county.immigration_activity
      elsif @map == "gun_control_activity"
        @counties[county.name] = county.gun_control_activity
      elsif @map == "environment_activity"
        @counties[county.name] = county.environment_activity
      end
      puts @counties[county.name]
    end
    render "map/#{params[:state].downcase}"
  end
end
