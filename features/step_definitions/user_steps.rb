Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        # byebug
        User.create user
    end
end

Given /^I am logged in with username, (.*), and password, (.*)$/ do |username, password|
end

Given /^I am not logged in$/ do
end

When /I (un)?check the following interests: (.*)/ do |uncheck, interest_list|
    interest_list.split(', ').each do |interest|
        step %{I #{uncheck.nil? ? '' : 'un'}check "interests_#{interest}"}
    end
end

Then /the following interests should (not )?be checked: (.*)/ do |uncheck, interest_list|
    interest_list.split(', ').each do |interest|
        step %{the "interests_#{interest}" checkbox should#{uncheck.nil? ? '' : ' not'} be checked}
    end
end