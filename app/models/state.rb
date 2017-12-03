class State < ActiveRecord::Base
	def State.get_states_with_activity(interest)
		states = State.all
	    states.each do |state|
	      if interest == "immigration_activity"
	        state.activity = state.immigration_activity
	      elsif interest == "gun_control_activity"
	        state.activity = state.gun_control_activity
	      elsif interest == "environment_activity"
	        state.activity = state.environment_activity
	      end
	    end
	    return states
	end
end
