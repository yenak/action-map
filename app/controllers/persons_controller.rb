class PersonsController < ApplicationController
	def create
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
		if person_params
			string_date = [person_params["birthday(1i)"], person_params["birthday(2i)"], person_params["birthday(3i)"]].join("-")
			person_params["birthday"] = Date.parse(string_date)
			@person.update_attributes(name: person_params["name"], birthday: person_params["birthday"],
				sex: person_params["sex"], email: person_params["email"], phone_number: person_params["phone_number"],
				description: person_params["description"])
		end
	end

	def show
		begin
			@person = Person.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			@not_found = true
		end
	end
end
