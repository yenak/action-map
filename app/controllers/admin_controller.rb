class AdminController < ApplicationController
  def map
    @states = State.all
    @counties = {}
    @states.each do |state|
      @counties[state] = County.where(:states_id => state.id)
    end
  end
end
