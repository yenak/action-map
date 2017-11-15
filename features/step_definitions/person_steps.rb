When /^I should be redirected to the person page for "(.*)" who is a "(.*)" with birthday "(.*)"/ do |fullname, gender, birthday|
	name = fullname.titleize
	sex = gender.capitalize
	date = Date.parse(birthday)
    person = Person.where(name: name, sex: sex, birthday: date)[0]
    visit edit_person_path(person.id)
end

When /^I select "(.*)" for "(.*)"/ do |value, field_name|
	selector = "#" + field_name
	within "select[id=#{field_name}]" do
		select value
	end
end