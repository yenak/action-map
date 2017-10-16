class User < ActiveRecord::Base

    def self.find_by_username(username)
        User.where(:username => username)[0]
    end

    def self.all_interests
        ["environment", "gun control", "immigration"]
    end

end
