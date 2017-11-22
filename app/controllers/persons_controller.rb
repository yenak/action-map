class PersonsController < ApplicationController
	def create
		byebug
		person_params = params[:person]
		string_date = [person_params["birthday(1i)"], person_params["birthday(2i)"], person_params["birthday(3i)"]].join("-")
		person_params["birthday"] = Date.parse(string_date)
		@person = Person.create!(name: person_params["name"], birthday: person_params["birthday"],
			sex: person_params["sex"], email: person_params["email"], phone_number: person_params["phone_number"],
			description: person_params["description"])
		redirect_to edit_person_path(@person)
	end

	def new
	end

	def edit
		@person = Person.find(params[:id])
		person_params = params[:person]
		new_name = person_params["name"] || @person.name
		new_sex = person_params["sex"] || @person.sex
		new_email = person_params["email"] || @person.email
		new_phone_number = person_params["phone_number"] || @person.phone_number
		new_description = person_params["description"] || @person.description
		if person_params
			string_date = [person_params["birthday(1i)"], person_params["birthday(2i)"], person_params["birthday(3i)"]].join("-")
			new_birthday = Date.parse(string_date)
		else
			new_birthday = @person.birthday
		end
		@person.update_attributes(name: new_name, sex: new_sex, birthday: new_birthday,
								  email: new_email, phone_number: new_phone_number,
								  description: new_description)

	end

	def show
		begin
			@person = Person.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			@not_found = true
		end
	end
end
