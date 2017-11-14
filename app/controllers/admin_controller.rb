class AdminController < ApplicationController
  def map
    @states = State.all
    @counties = {}
    @states.each do |state|
      @counties[state] = County.where(:states_id => state.id)
    end
  end

  def update_activity
    if params[:class] == 'state'
      state = State.find_by_id(params[:id])
      state.activity = params[:activity]
      state.save!
    elsif params[:class] == 'county'
      county = County.find_by_id(params[:id])
      county.activity = params[:activity]
      county.save!
    end
    render json: {}, status: 200
  end
end
