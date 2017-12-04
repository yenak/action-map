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

@omniauth_test
Scenario: user can logout
  Given I am signed in with provider "Google"
  When I follow "Logout"
  Then I should not see "Logout"
  And I should see "Login"
  
@omniauth_test
Scenario: an existing user logins
  Given I am signed in with provider "Google"
  And I should see "Account"
  And I follow "Logout"
  And I am signed in with provider "Google"
  Then I should be on the home page