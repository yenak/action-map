class Person < ActiveRecord::Base
	def Person.create_person(person_params)
		string_date = [person_params["birthday(1i)"], person_params["birthday(2i)"], person_params["birthday(3i)"]].join("-")
		person_params["birthday"] = Date.parse(string_date)
		Person.create!(name: person_params["name"], birthday: person_params["birthday"],
			sex: person_params["sex"], email: person_params["email"], phone_number: person_params["phone_number"],
			description: person_params["description"])
	end

	def update_person(person_params)
		string_date = [person_params["birthday(1i)"], person_params["birthday(2i)"], person_params["birthday(3i)"]].join("-")
		person_params["birthday"] = Date.parse(string_date)
		self.update_attributes(name: person_params["name"], birthday: person_params["birthday"],
			sex: person_params["sex"], email: person_params["email"], phone_number: person_params["phone_number"],
			description: person_params["description"])
	end
end
