Feature: User should be able to log in to an existing account or create a new one.

  As a concerned activist
  So that I can stay updated in topic I care about
  I want to set interests to filter the information I receive

Background: interests "environment", "gun control", "immigration" exist

  Given the following users exist:
  | username                | password   |    interests |
  | user1                   | password1  |    []        |
  | user2                   | password2  |    []        |

Scenario: save interests button works
  When I am on the interests page for "user1"
  And I press "save"
  Then I should be on the interests page for "user1"

Scenario: interest selections are saved
  # see assignment
  When I check the following interests: environment, gun control
  When I press "save"
  Then the "environment" checkbox should be checked
  And the "gun control" checkbox should be checked
  And the "immigration" checkbox should not be checked
  
 Scenario: interests still saved after page change
   When I am on the interests page for "user1"
   And I check the following interests: "environment"
   And I press "save"
   And I go to the home page
   And I go to the interests page "user1"
   Then the "environment" checkbox should be checked
   And the "gun control" checkbox should be checked
   And the "immigration" checkbox should not be checked
#   pages need to be added to paths
