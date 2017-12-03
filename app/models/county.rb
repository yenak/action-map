class County < ActiveRecord::Base
	def County.get_counties_in_state(state_id)
		County.where(states_id: state_id)
	end

	def County.get_counties_with_activity(counties, interest)
		if counties.nil?
			return Array.new
		end
	    counties.each do |county|
	      if interest == "immigration_activity"
	        county.activity = county.immigration_activity
	      elsif interest == "gun_control_activity"
	        county.activity = county.gun_control_activity
	      elsif interest == "environment_activity"
	        county.activity = county.environment_activity
	      end
	    end
	    return counties
	end
end
