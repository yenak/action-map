require 'rails_helper'

describe PersonsController, type: :controller do
    before(:each) do
        people = [{:name => 'Barack Obama', :sex => 'Male', :birthday => Date.parse("2016-04-08"), :description => "",
                   :phone_number => "", :email => ""},
                 ]
        people.each do |person|
          Person.create!(person)
        end
        @myPerson = Person.where(name: "Barack Obama")[0]
    end
    describe "Go to person's show page" do
        it "tries to find the person" do
            expect(Person).to receive(:find).with(@myPerson.id.to_s)
            get 'show', {:id => @myPerson.id}
        end
        it "passes the person to the view" do
            get 'show', {:id => @myPerson.id}
            expect(assigns(:person)).to_not be_nil
        end
        it "finds the right person" do
            get 'show', {:id => @myPerson.id}
            expect(assigns(:person)).to eq(@myPerson)
        end
        it "redirects to the person's page" do
            get 'show', {:id => @myPerson.id}
            expect(response).to render_template(:show)
        end
    end
end