Feature: User should be able to log in through a Google account

  As a concerned activist
  So that I can keep track of my settings and interests
  I want to be able to log in or create an account.

Scenario: user has the option to use Google account authentication
  Given I am on the home page
  Then I should see "Sign in with Google"

@omniauth_test
Scenario: user should not see a log in button after signing in
  Given I am signed in with provider "Google"
  And I am on the home page
  Then I should not see "Sign in with Google"

@omniauth_test
Scenario: user should see a log out butotn after signing in
  Given I am signed in with provider "Google"
  And I am on the home page
  Then I should see "Log out"
  And I should see "Example User"
