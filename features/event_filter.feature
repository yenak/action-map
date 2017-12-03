Feature: The events can be filtered.

  As a user
  So that I can see what events are available
  I want to be able to filter the events.
  

Background: events have been added to database

  Given the following events exist:
  | name                    | state   | county        |
  | Event 1                 | CA      | San Francisco |
  | Event 2                 | LA      | N/A           |
  | Event 3                 | CA      | Alameda       |
  | Event 4                 | WI      | Dane          |
  | Event 5                 | WI      | Sun Prairie   |

Scenario: unfiltered
  Given I am on the events page
  Then I should see "Event 1"
  And I should see "Event 2"
  And I should see "Event 3"
  And I should see "Event 4"
  And I should see "Event 5"
  
Scenario: filter by state
  Given I am on the events page
  And I select "California" from "state"
  When I press "Filter by State"
  Then I should be on the events page
  And I should see "Event 1"
  And I should see "Event 3"
  And I should not see "Event 2"
  And I should not see "Event 4"
  And I should not see "Event 5"
  
Scenario: reset filter
  Given I am on the events page
  And I select "California" from "state"
  And I press "Filter by State"
  And I should be on the events page
  And I should see "Event 1"
  And I should see "Event 3"
  And I should not see "Event 2"
  And I should not see "Event 4"
  And I should not see "Event 5"
  When I press "Reset Filters"
  Then I should be on the events page
  And I should see "Event 1"
  And I should see "Event 2"
  And I should see "Event 3"
  And I should see "Event 4"
  And I should see "Event 5"