require 'rails_helper'

describe UsersController, type: :controller do
    context "with user" do
        let(:user) { create :user, :obama }
        describe "Go to user's interest page" do
            it "tries to find the user object" do
                get 'show', {:id => user.id}
                expect(assigns(:user)).to eq(user)
            end
            it "passes the all interests to the view" do
                get 'show', {:id => user.id}
                expect(assigns(:all_interests)).to eq(User.all_interests)
            end
            it "passes the user's interests to the view" do
                get 'show', {:id => user.id}
                expect(assigns(:selected_interests)).to eq(user.interests)
            end
            it "redirects to the user's page" do
                get 'show', {:id => user.id}
                expect(response).to render_template(:show)
            end
        end

        describe "Modify a user's interests" do
            let(:interests) { {"gun control" => 1} }
            it "tries to find the user object" do
                post 'edit', {:id => user.id, :interests => interests}
                expect(assigns(:user)).to eq(user)
            end
            it "sets the users interests to the newly selected ones" do
                post 'edit', {:id => user.id, :interests => interests}
                expect(assigns(:selected_interests)).to eq(interests.keys)
            end
            it "sets the users interests to an empty string if none are selected" do
                post 'edit', {:id => user.id}
                expect(assigns(:selected_interests)).to eq("")
            end
            it "tries to update the user object" do
                expect_any_instance_of(User).to receive(:update_interests).with(interests.keys)
                post 'edit', {:id => user.id, :interests => interests}
            end
            it "shows the users's page" do
                post 'edit', {:id => user.id, :interests => interests}
                expect(response).to redirect_to(user_path)
            end
        end
    end

end
