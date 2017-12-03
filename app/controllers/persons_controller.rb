class PersonsController < ApplicationController
	def create
		person_params = params[:person]
		@person = Person.create_person(person_params)
		redirect_to edit_person_path(@person)
	end

	def new
	end

	def index
		@persons = Person.all
	end

	def edit
		@person = Person.find(params[:id])
		if params[:person]
			@person.update_person(params[:person])
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
