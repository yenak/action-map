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
  Then I should be on the login page.

Scenario: log into an existing account
  Given I am on the login page
  When I fill out the username field with user "user1"
  And I fill out the password field with password "password1"
  And I press "log in"
  Then I should be on the home page
  And I should see "user1"

Scenario: log into a nonexisting account
  Given I am on the login page
  When I fill out the username field with user "user1"
  And I fill out the password field with password "password2"
  And I press "log in"
  Then I should be on the login page
  And I should see "User and password match not found."

