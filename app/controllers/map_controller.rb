class MapController < ApplicationController
  def index
    @states = State.all
  end

  def state
    @counties = {}
    states_id = State.where(symbol: params[:state]).first.id
    County.where(states_id: states_id).each do |county|
      @counties[county.name] = county.activity
    end
    render "map/#{params[:state].downcase}"
  end
end
