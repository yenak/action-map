Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        newUser = User.new user
        newUser.skip_confirmation!
        newUser.save!
    end
end

Given /^I am logged in with email, (.*), and password, (.*)$/ do |email, password|
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

Given /^I am signed in with provider "([^"]*)"$/ do |provider|
    pending
    # http://samuelmullen.com/2011/05/simple-integration-testing-with-cucumber-and-omniauth/ to help implement
end

Given /^I am not signed in with provider "([^"]*)"$/ do |provider|
    pending
end