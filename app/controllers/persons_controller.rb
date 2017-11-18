class PersonsController < ApplicationController
	def create
		string_date = params[:person].values.join("-")
		birthdate = Date.parse(string_date)
		fullname = params[:fullname]
		sex = params[:sex]
		@person = Person.create!(name: fullname, birthday: birthdate, sex: sex)
		redirect_to edit_person_path(@person)
	end

	def new
	end

	def edit
		@person = Person.find(params[:id])
		new_name = params[:fullname] || @person.name
		new_sex = params[:sex] || @person.sex
		if params[:person]
			string_date = params[:person].values.join("-")
			new_birthday = Date.parse(string_date)
		else
			new_birthday = @person.birthday
		end
		@person.update_attributes(name: new_name, sex: new_sex, birthday: new_birthday)
	end
end
