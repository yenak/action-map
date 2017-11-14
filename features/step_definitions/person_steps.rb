When /^I should be on the person page for "(.*)" who is a "(.*)" with birthday "(.*)"/ do |fullname, gender, birthday|
	name = fullname.titleize
	gender = gender.capitalize
	date = Date.parse(birthday)
    person = Person.find(name: name, gender: gender, date: birthday)
    visit person_edit_path(person)
end
