Feature: User should be able to log in to an existing account or create a new one.

  As a concerned activist
  So that I can stay updated in topic I care about
  I want to set interests to filter the information I receive

Background: interests "environment", "gun control", "immigration" exist

@omniauth_test
Scenario: save interests button works
  Given I am signed in with provider "Google"
  And I am on the interests page for "1234"
  When I press "Save"
  Then I should be on the interests page for "1234"

@omniauth_test
Scenario: interest selections are saved
  # see assignment
  Given I am signed in with provider "Google"
  And I am on the interests page for "1234"
  When I check the following interests: environment, gun control
  And I uncheck the following interests: immigration
  When I press "Save"
  Then the following interests should be checked: environment, gun control
  And the following interests should not be checked: immigration

@omniauth_test
Scenario: interests still saved after page change
  Given I am signed in with provider "Google"
  And I am on the interests page for "1234"
  When I check the following interests: environment
  And I uncheck the following interests: gun control, immigration
  And I press "Save"
  And I go to the home page
  And I go to the interests page for "1234"
  Then the following interests should be checked: environment
  And the following interests should not be checked: immigration, gun control
#   pages need to be added to paths
