Feature: Make phone call

  Users should be able to make phone calls to representatives. This is
  an essential part to the project as it helps convey the user's interests
  the best.

  Background:
    Given John Doe has the phone number 111-111-1111
    And the following users exist:
    | email         | password | interests |
    | user1@test    | password | []        |

  Scenario: calling a representative when logged in
    Given I am logged in with email, "user1@test", and password, "password"
    And I am on John Doe's page
    When I press "Call"
    Then I should place a call to 111-111-1111

  Scenario: trying to call a representative when not logged in should not work
    Given I am not logged in
    And I am on John Doe's page
    When I press "Call"
    Then I should not place a call
    And I should be on the login page
    And I should see "You must be logged in to call."
