Feature: Make phone call

  Users should be able to make phone calls to representatives. This is
  an essential part to the project as it helps convey the user's interests
  the best.

  Background:
    Given representative John Doe has the phone number 111-111-1111
    And a user with username, "a", and password, "password" exists

  Scenario: calling a representative when logged in
    Given I am logged in with username, "a", and password, "password"
    And I am on representative John Doe's page
    When I click on the "Call" button
    Then I should place a call to 111-111-1111

  Scenario: trying to call a representative when not logged in should not work
    Given I am not logged in
    And I am on representative John Doe's page
    When I click on the "Call" button
    Then I should not place a call
    And I should be redirected to the login page
    And I should see the message "You must be logged in to call."
