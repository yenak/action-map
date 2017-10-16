Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        # byebug
        User.create user
    end
end

When /I check the following interests: (.*)/ do |interest_list|
    interest_list.split(', ').each do |interest|
        step %{I check "interests_#{interest}"}
    end
end 