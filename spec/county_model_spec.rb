require 'rails_helper'

describe County, type: :model do
  context "with a single county"
    describe "have immigration_activity as selected interest" do
      it "sets county activity accordingly" do
        county = County.create!(name: "test", immigration_activity: "i_active", gun_control_activity: "gc_active", environment_activity: "e_active")
        result = County.get_counties_with_activity(County.all, "immigration_activity")
        result.each do |r|
          expect(r.activity).to eq("i_active")
        end
      end
    end
    describe "have gun_control_activity as selected interest" do
      it "sets county activity accordingly" do
        county = County.create!(name: "test", immigration_activity: "i_active", gun_control_activity: "gc_active", environment_activity: "e_active")
        result = County.get_counties_with_activity(County.all, "gun_control_activity")
        result.each do |r|
          expect(r.activity).to eq("gc_active")
        end
      end
    end
    describe "have environment_activity as selected interest" do
      it "sets county activity accordingly" do
        county = County.create!(name: "test", immigration_activity: "i_active", gun_control_activity: "gc_active", environment_activity: "e_active")
        result = County.get_counties_with_activity(County.all, "environment_activity")
        result.each do |r|
          expect(r.activity).to eq("e_active")
        end
      end
    end
end
