require 'rails_helper'

describe AdminController, type: :controller do
  context "with one state and one county" do
    describe "GET /admin/map" do
      it "returns all counties and states" do
        state = State.create!(name: "Test State")
        county = County.create!(name: "Test County", states_id: state.id)

        get "map"
        expect(assigns(:states)).to eq([state])
        expect(assigns(:counties)).to eq(Hash[state => [county]])
      end
    end
    describe "POST /admin/update_activity for state" do
      it "updates activity of the state" do
        state = State.create!(name: "Test State", activity: "active")
        county = County.create!(name: "Test County", states_id: state.id, activity: "active")

        post "update_activity", {:id => state.id, :class => 'state', :activity => 'inactive'}
        expect(State.find_by_id(state.id).activity).to eq('inactive')
      end
    end
    describe "POST /admin/update_activity for county" do
      it "updates activity of the county" do
        state = State.create!(name: "Test State", activity: "active")
        county = County.create!(name: "Test County", states_id: state.id, activity: "active")

        post "update_activity", {:id => county.id, :class => 'county', :activity => 'inactive'}
        expect(County.find_by_id(county.id).activity).to eq('inactive')
      end
    end
  end
end
