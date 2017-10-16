Feature: User should be able to log in to an existing account or create a new one.

  As a concerned activist
  So that I can keep track of my settings and interests
  I want to be able to log in or create an account.

Background: movies have been added to database

  Given the following users exist:
  | username                | password   |
  | user1                   | password1  |
  | user2                   | password2  |

Scenario: go to the login page
  When I am on the home page
  And I press "log in"
  Then I should be on the login page

Scenario: log into an existing account
  Given I am on the login page
  When I fill in "user_username" with "user1"
  And I fill in "user_password" with "password1"
  And I press "log in"
  Then I should be on the home page
  And I should see "user1"

Scenario: log into a nonexisting account
  Given I am on the login page
  When I fill in "user_username" with "user1"
  And I fill in "user_password" with "password2"
  And I press "log in"
  Then I should be on the login page
  And I should see "User and password match not found."
  
Scenario: go to new account creation page
  Given I am on the login page
  And I press "create new account"
  Then I should be on the new account page

Scenario: Successfully creating a new account
  Given I am on the new account page
  When I fill in "user_username" with "user3"
  And I fill in "user_password" with "password3"
  And I fill in "user_confirm_password" with "password3"
  Then I should be on the interests page
  And I should see "user3"
  
  
Scenario: Attempt to create account with existing username
  Given I am on the new account page
  When I fill in "user_username" with "user1"
  And I fill in "user_password" with "password3"
  And I fill in "user_confirm_password" with "password3"
  Then I should be on the new account page
  And I should see "Username taken"

Scenario: filling in confirm password with wrong password
  Given I am on the new account page
  When I fill in "user_username" with "user1"
  And I fill in "user_password" with "password3"
  And I fill in "user_confirm_password" with "password4"
  Then I should be on the new account page
  And I should see "confirm password does not match password"

