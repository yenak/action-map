class Person < ActiveRecord::Base
	def Person.create_person(form_params)
		Person.create!(Person.form_to_person_params(form_params))
	end

	def update_person(form_params)
		self.update_attributes(Person.form_to_person_params(form_params))
	end

	def Person.form_to_person_params(form_params)
		string_date = [form_params["birthday(1i)"], form_params["birthday(2i)"], form_params["birthday(3i)"]].join("-")
		birthday = Date.parse(string_date)
		return {name: form_params["name"], birthday: birthday,
			sex: form_params["sex"], email: form_params["email"], phone_number: form_params["phone_number"],
			description: form_params["description"]}
	end
end
