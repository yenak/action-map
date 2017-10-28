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
  And I follow "Log In"
  Then I should be on the login page

Scenario: log into an existing account
  Given I am on the login page
  When I fill in "user_username" with "user1"
  And I fill in "user_password" with "password1"
  And I press "Log In"
  Then I should be on the home page
  And I should see "user1"

Scenario: log into a nonexisting account
  Given I am on the login page
  When I fill in "user_username" with "user1"
  And I fill in "user_password" with "password2"
  And I press "Log In"
  Then I should be on the login page
  And I should see "User and password match not found."

Scenario: go to new account creation page
  Given I am on the login page
  And I follow "Create new account"
  Then I should be on the new account page

Scenario: Successfully creating a new account
  Given I am on the new account page
  When I fill in "user_username" with "user3"
  And I fill in "user_password" with "password3"
  And I fill in "user_confirm_password" with "password3"
  And I press "Sign Up"
  Then I should be on the interests page for "user3"
  And I should see "user3"


Scenario: Attempt to create account with existing username
  Given I am on the new account page
  When I fill in "user_username" with "user1"
  And I fill in "user_password" with "password3"
  And I fill in "user_confirm_password" with "password3"
  And I press "Sign Up"
  Then I should be on the new account page
  And I should see "Username already exists."

Scenario: filling in confirm password with wrong password
  Given I am on the new account page
  When I fill in "user_username" with "user3"
  And I fill in "user_password" with "password3"
  And I fill in "user_confirm_password" with "password4"
  And I press "Sign Up"
  Then I should be on the new account page
  And I should see "Passwords must match."
  
  Scenario: user has the option to use Google account authentication
    Given I am on the login page
    Then I should see "Sign in with Google"
  
  Scenario: User signs in with Google account while signed into Google
    Given I am on the login page
    And I am signed in with Google
    And I press "Sign in with Google"
    Then I should be on the home page
  
  Scenario: User signs in with Google account while not signed into Google
    Given I am on the login page
    And I am not signed in with Google
    And I press "Sign in with Google"
    Then I should see "Choose an account to continue"
    

