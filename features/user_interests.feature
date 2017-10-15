Feature: User should be able to log in to an existing account or create a new one.

  As a concerned activist
  So that I can stay updated in topic I care about
  I want to set interests to filter the information I receive

Background: i1, i2, i3 exist

  Given the following users exist:
  | username                | password   |
  | user1                   | password1  |
  | user2                   | password2  |

Scenario: save interests button works
  When I am on the interests page
  And I press "save interests"
  Then I should be on the interests page

Scenario: interest selections are saved
  # see assignment
  When I check the following interests: i1, i2 
  When I press "save interests"
  Then the i1 checkbox should be checked
  And the i2 checkbox should be checked
  And the i3 checkbox should not be checked
  
 Scenario: interests still saved after page change
   When I am on the interests page
   And I check the following interests: i1, i2
   And I go to the home page
   And I go to the interests page
   Then the i1 checkbox should be checked
   And the i2 checkbox should be checked
   And the i3 checkbox should not be checked
#   pages need to be added to paths
