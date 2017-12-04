class MapController < ApplicationController
  def index
    flash[:notice] = params[:map] || ""
    @map = params[:map] || "immigration_activity"
    @states = State.get_states_with_activity(@map)
  end

  def state
    states_id = State.where(symbol: params[:state]).first.id
    @map = params[:map] || ""
    flash[:notice] = params[:map]
    @counties = County.get_counties_in_state(states_id)
    @counties = County.get_counties_with_activity(@counties, @map)
    render "map/#{params[:state].downcase}"
  end
end
