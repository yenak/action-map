class User < ActiveRecord::Base

    def User.find_by_uid(uid)
        User.where(:uid => uid)[0]
    end

    def User.all_interests
        ["environment", "gun control", "immigration"]
    end

    def update_interests(interests)
    	self.update_attributes(:interests => interests)
    end

end
