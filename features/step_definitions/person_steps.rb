require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

When /^I should be directed to the person page for "(.*)" who is a "(.*)" with birthday "(.*)"/ do |fullname, gender, birthday|
	name = fullname.titleize
	sex = gender.capitalize
	date = Date.parse(birthday)
    person = Person.where(name: name, sex: sex, birthday: date)[0]
    visit edit_person_path(person.id)
end

Given /^there is (a|no) person named "(.*)" who is a "(.*)" with birthday "(.*)"/ do |negative, fullname, gender, birthday|
	name = fullname.titleize
	sex = gender.capitalize
	date = Date.parse(birthday)
	if negative == "no"
		person = Person.where(name: name, sex: sex, birthday: date)
		if person.length != 0
			raise "#{person} actually does exist when it should not."
		end
	else
    	Person.create(name: name, sex: sex, birthday: date)
    end
end

When /^I select "(.*)" for "(.*)"/ do |value, field_name|
	selector = "#" + field_name
	within "select[id=#{field_name}]" do
		select value
	end
end