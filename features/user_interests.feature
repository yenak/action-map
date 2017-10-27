Feature: User should be able to log in to an existing account or create a new one.

  As a concerned activist
  So that I can stay updated in topic I care about
  I want to set interests to filter the information I receive

Background: interests "environment", "gun control", "immigration" exist

  Given the following users exist:
  | email                | password   |    interests |
  | user1@test           | password1  |    []        |
  | user2@test           | password2  |    []        |

Scenario: save interests button works
  Given I am on the interests page for "user1@test"
  When I press "Save"
  Then I should be on the interests page for "user1@test"

Scenario: interest selections are saved
  # see assignment
  Given I am on the interests page for "user1@test"
  When I check the following interests: environment, gun control
  And I uncheck the following interests: immigration
  When I press "Save"
  Then the following interests should be checked: environment, gun control
  And the following interests should not be checked: immigration

 Scenario: interests still saved after page change
   Given I am on the interests page for "user1@test"
   When I check the following interests: environment
   And I uncheck the following interests: gun control, immigration
   And I press "Save"
   And I go to the home page
   And I go to the interests page for "user1@test"
   Then the following interests should be checked: environment
   And the following interests should not be checked: immigration, gun control
#   pages need to be added to paths
