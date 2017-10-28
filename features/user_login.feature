Feature: User should be able to log in to an existing account or create a new one.

  As a concerned activist
  So that I can keep track of my settings and interests
  I want to be able to log in or create an account.

Background: movies have been added to database

  Given the following users exist:
  | email                        | password   |
  | user1@test                   | password1  |
  | user2@test                   | password2  |

Scenario: go to the login page
  When I am on the home page
  And I follow "Log in"
  Then I should be on the login page

Scenario: log into an existing account
  Given I am on the login page
  When I fill in "Email" with "user1@test"
  And I fill in "Password" with "password1"
  And I press "Log in"
  Then I should be on the home page
  And I should see "user1@test"

Scenario: log into a nonexisting account
  Given I am on the login page
  When I fill in "Email" with "user1@test"
  And I fill in "Password" with "password2"
  And I press "Log in"
  Then I should be on the login page
  And I should see "Invalid Email or password."

Scenario: go to new account creation page
  Given I am on the login page
  And I follow "Sign up"
  Then I should be on the new account page

Scenario: Successfully creating a new account
  Given I am on the new account page
  When I fill in "Email" with "user3@test"
  And I fill in "Password" with "password3"
  And I fill in "Password confirmation" with "password3"
  And I press "Sign up"
  Then I should be on the new account page
  And I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."

Scenario: Attempt to create account with existing email
  Given I am on the new account page
  When I fill in "Email" with "user1@test"
  And I fill in "Password" with "password3"
  And I fill in "Password confirmation" with "password3"
  And I press "Sign up"
  Then I should be on the new account page
  And I should see "Email has already been taken"

Scenario: filling in confirm password with wrong password
  Given I am on the new account page
  When I fill in "Email" with "user3@test"
  And I fill in "Password" with "password3"
  And I fill in "Password confirmation" with "password4"
  And I press "Sign up"
  Then I should be on the new account page
  And I should see "Password confirmation doesn't match Password"

Scenario: Creating an account with too short of a password
  Given I am on the new account page
  When I fill in "Email" with "user3@test"
  And I fill in "Password" with "pass3"
  And I fill in "Password confirmation" with "pass3"
  And I press "Sign up"
  Then I should be on the new account page
  And I should see "Password is too short (minimum is 6 characters)"

