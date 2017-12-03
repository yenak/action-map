Feature: A new event can be added to the database.

  As a political activist or administrator
  So that other users can see and participate in my event
  I want to be able to add new events.

Scenario: be able to add new event
  Given I am on the events page
  When I follow "Add Event"
  Then I should be on the add events page
  
Scenario: add new event
  Given I am on the add events page
  And I fill in "Event Title" with "Event 1"
  And I select "California" from "state"
  And I fill in "County" with "San Francisco"
  And I fill in "Event Description" with "Come to Event 1!"
  When I press "Add Event"
  Then I should be on the events page
  And I should see "Event 1"
  And I should see "CA"
  And I should see "San Francisco"
  And I should see "Come to Event 1!"
  
Scenario: user doesn't select a state
  Given I am on the add events page
  When I press "Add Event"
  Then I should be on the add events page
  And I should see "Please choose a state."
  
Scenario: end date is before start date
  Given I am on the add events page
  And I select "Arizona" from "state"
  And I select "2018" from "event_start_time_1i"
  And I select "2017" from "event_end_time_1i"
  When I press "Add Event"
  Then I should be on the add events page
  And I should see "Make sure end date is after start date."