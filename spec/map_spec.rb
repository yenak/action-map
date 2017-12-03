require 'rails_helper'

describe MapController, type: :controller do
    describe "Go to gun control map" do
        it "sends all the states to the view" do
            get 'index'
            expect(assigns(:states)).to eq(State.all)
        end
        it "gets the passed in map type if none are passed in" do
            get 'index'
            expect(assigns(:map)).to eq("")
        end
        it "gets the passed in map type if one is passed in" do
            get 'index', { :map => "gun control" }
            expect(assigns(:map)).to eq("gun control")
        end
        it "gets the states with its activity field set to the desired interest" do
        	expect(State).to receive(:get_states_with_activity).with("gun control")
        	get 'index', { :map => "gun control" }
        end
    end

    describe "Go to gun control california map" do
    	context "with state" do
	    	let(:state) { create :state, :california }
	    	it "gets the passed in map type if none are passed in" do
	    		get 'state', { :state => state.symbol }
	    		expect(assigns(:map)).to eq("")
	    	end
	    	it "gets the passed in map type if one is passed in" do
	            get 'state', { :state => state.symbol, :map => "gun control" }
	            expect(assigns(:map)).to eq("gun control")
	        end
	        it "gets only the counties within a specific state" do
	        	expect(County).to receive(:get_counties_in_state)
	        	get 'state', { :state => state.symbol }
	        end
	        it "gets the counties with its activity field set to the desired interest" do
	        	expect(County).to receive(:get_counties_with_activity)
	        	get 'state', { :state => state.symbol, :map => "gun control" }
	        end
	        it "should render the state's view" do
	        	get 'state', { :state => state.symbol, :map => "gun control" }
	        	expect(response).to render_template("map/#{state.symbol.downcase}")
	        end
	    end
    end

end
