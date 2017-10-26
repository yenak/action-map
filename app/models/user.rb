class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def self.find_by_username(username)
        User.where(:username => username)[0]
    end

    def self.all_interests
        ["environment", "gun control", "immigration"]
    end

end
