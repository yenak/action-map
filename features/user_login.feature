Feature: User should be able to log in through a Google account

  As a concerned activist
  So that I can keep track of my settings and interests
  I want to be able to log in or create an account.

Scenario: user can log in
  Given I am on the home page
  Then I should see "Login"

@omniauth_test
Scenario: user should not see a log in button after signing in
  Given I am signed in with provider "Google"
  And I am on the home page
  Then I should not see "Login"

@omniauth_test
Scenario: user should see a log out button after signing in
  Given I am signed in with provider "Google"
  And I am on the home page
  Then I should see "Logout"
