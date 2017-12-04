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
    if provider.downcase == "google"
        visit login_path
    end
end