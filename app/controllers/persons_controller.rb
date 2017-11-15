class PersonsController < ApplicationController
	def create
		string_date = params[:person].values.join("-")
		birthdate = Date.parse(string_date)
		fullname = params[:fullname]
		sex = params[:sex]
		@person = Person.create!(name: fullname, birthday: birthdate, sex: sex)
		redirect_to root_path
	end

	def new
	end
end
