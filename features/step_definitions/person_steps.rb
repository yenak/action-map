require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

When /^I should be directed to the person page for "(.*)" who is a "(.*)" with birthday "(.*)", email "(.*)", phone number "(.*)", and description "(.*)"/ do |fullname, gender, birthday, email, phone_number, description|
	name = fullname.titleize
	sex = gender.capitalize
	date = Date.parse(birthday)
    person = Person.where(name: name, sex: sex, birthday: date,
    	                  phone_number: phone_number, email: email,
    	                  description: description)[0]
    visit edit_person_path(person.id)
end

Given /^there is (a|no) person named "(.*)" who is a "(.*)" with birthday "(.*)", email "(.*)", phone number "(.*)", and description "(.*)"/ do |negative, fullname, gender, birthday, email, phone_number, description|
	name = fullname.titleize
	sex = gender.capitalize
	date = Date.parse(birthday)
	if negative == "no"
		person = Person.where(name: name, sex: sex, birthday: date,
				              phone_number: phone_number, email: email,
				              description: description)
		if person.length != 0
			raise "#{person} actually does exist when it should not."
		end
	else
    	person = Person.create(name: name, sex: sex, birthday: date,
	    	                   phone_number: phone_number, email: email,
	    	                   description: description)
    end
end

When /^I select "(.*)" for "(.*)"/ do |value, field_name|
	selector = "#" + field_name
	within "select[id=#{field_name}]" do
		select value
	end
end