class PersonsController < ApplicationController
	def create
		string_date = params[:person].values.join("-")
		birthdate = Date.parse(string_date)
		fullname = params[:fullname]
		sex = params[:sex]
		email = params[:email]
		phone_number = params[:phone_number]
		description = params[:description]
		@person = Person.create!(name: fullname, birthday: birthdate, sex: sex,
								 email: email, phone_number: phone_number,
								 description: description)
		redirect_to edit_person_path(@person)
	end

	def new
	end

	def edit
		@person = Person.find(params[:id])
		new_name = params[:fullname] || @person.name
		new_sex = params[:sex] || @person.sex
		new_email = params[:email] || @person.email
		new_phone_number = params[:phone_number] || @person.phone_number
		new_description = params[:description] || @person.description
		if params[:person]
			string_date = params[:person].values.join("-")
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
