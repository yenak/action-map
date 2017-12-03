require 'rails_helper'

describe State, type: :model do
  context "with a single state"
    describe "have immigration_activity as selected interest" do
      it "sets state activity accordingly" do
        state = State.create!(name: "test", immigration_activity: "i_active", gun_control_activity: "gc_active", environment_activity: "e_active")
        result = State.get_states_with_activity("immigration_activity")
        result.each do |r|
          expect(r.activity).to eq("i_active")
        end
      end
    end
    describe "have gun_control_activity as selected interest" do
      it "sets state activity accordingly" do
        state = State.create!(name: "test", immigration_activity: "i_active", gun_control_activity: "gc_active", environment_activity: "e_active")
        result = State.get_states_with_activity("gun_control_activity")
        result.each do |r|
          expect(r.activity).to eq("gc_active")
        end
      end
    end
    describe "have environment_activity as selected interest" do
      it "sets state activity accordingly" do
        state = State.create!(name: "test", immigration_activity: "i_active", gun_control_activity: "gc_active", environment_activity: "e_active")
        result = State.get_states_with_activity("environment_activity")
        result.each do |r|
          expect(r.activity).to eq("e_active")
        end
      end
    end
end
