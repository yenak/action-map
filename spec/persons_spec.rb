require 'rails_helper'

describe PersonsController, type: :controller do
    context "with person" do
        let(:person) { create :person, :obama }
        describe "Go to person's show page" do
            it "tries to find the person" do
                expect(Person).to receive(:find).with(person.id.to_s)
                get 'show', {:id => person.id}
            end
            it "passes the person to the view" do
                get 'show', {:id => person.id}
                expect(assigns(:person)).to_not be_nil
            end
            it "finds the right person" do
                get 'show', {:id => person.id}
                expect(assigns(:person)).to eq(person)
            end
            it "redirects to the person's page" do
                get 'show', {:id => person.id}
                expect(response).to render_template(:show)
            end
        end

        describe "Go to a non-existant person's page" do
            it "tries to find the person" do
                expect(Person).to receive(:find).with(999.to_s)
                get 'show', {:id => 999}
            end
            it "tells the view that the person isn't found" do
                get 'show', {:id => 999}
                expect(assigns(:not_found)).to eq(true)
            end
        end
    end

    describe "create new person" do
        let(:person) { {"name": "Barack Obama", "sex": "Male",
            "birthday(1i)": "1961", "birthday(2i)": "04", "birthday(3i)": "08", "description": "44th President",
            "phone_number": "1-800-333-3333", "email": "bobama@gmail.com"} }
        let(:birthday) { Date.parse("1961-04-08") }
        before(:each) do
            post 'create', {"person": person}
        end
        it "creates a new person" do
            expect(Person.count).to eq(1)
        end
        it "created the right person" do
            created_person = Person.where(name: "Barack Obama", sex: "Male",
                birthday: Date.parse("1961-04-08"), description: "44th President",
                phone_number: "1-800-333-3333", email: "bobama@gmail.com")
            expect(created_person.count).to_not eq(0)
        end
        it "redirects you to the person's edit page" do
            created_person = Person.where(name: "Barack Obama", sex: "Male",
                birthday: birthday, description: "44th President",
                phone_number: "1-800-333-3333", email: "bobama@gmail.com")[0]
            expect(response).to redirect_to(edit_person_path(created_person.id))
        end
    end

    describe "edit a person" do
        let(:new_person_params) { {"name": "Bobama", "sex": "Female",
            "birthday(1i)": "1960", "birthday(2i)": "03", "birthday(3i)": "07", "description":
            "44th Vice President", "phone_number": "1-800-222-2222", "email": "boba@gmail.com"} }
        let(:birthday) { Date.parse("1960-03-07") }
        let(:person) {Person.create(name: "Barack Obama", sex: "Male",
            birthday: Date.parse("1961-04-08"), description: "44th President",
            phone_number: "1-800-333-3333", email: "bobama@gmail.com") }
        before(:each) do
            get 'edit', { id: person.id, "person": new_person_params }
        end
        it "should update the same object" do
            new_person = Person.where(name: "Bobama", sex: "Female",
                birthday: birthday, description: "44th Vice President",
                phone_number: "1-800-222-2222", email: "boba@gmail.com")[0]
            expect(person).to eq(new_person)
        end
        it "should pass the object to the view" do
            expect(assigns(:person)).to eq(person)
        end
        it "should render the person's show page" do
            expect(response).to render_template(:edit)
        end
    end

    describe "visit a person's page" do
        let(:person) {Person.create(name: "Barack Obama", sex: "Male",
            birthday: Date.parse("1961-04-08"), description: "44th President",
            phone_number: "1-800-333-3333", email: "bobama@gmail.com") }
        before(:each) do
            get 'edit', { id: person.id }
        end
        it "should not update attributes" do
            old_person = Person.where(name: "Barack Obama", sex: "Male",
                birthday: Date.parse("1961-04-08"), description: "44th President",
                phone_number: "1-800-333-3333", email: "bobama@gmail.com")[0]
            expect(assigns(:person)).to eq(old_person)
        end
        it "should render the person's show page" do
            expect(response).to render_template(:edit)
        end
    end
end
