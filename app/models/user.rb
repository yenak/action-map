class User < ActiveRecord::Base

    def self.find_by_uid(uid)
        User.where(:uid => uid)[0]
    end

    def self.all_interests
        ["environment", "gun control", "immigration"]
    end

end
