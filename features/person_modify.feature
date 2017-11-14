Feature: A new person can be added to the database and modified.

  As an administrator
  So that I can update the representatives inside the database
  I want to be able to add new representatives and modify old ones.

Scenario: add new representative
	When I am on the person creation page
	And I fill in "name" with "Barack Obama"
	And I fill in "birthday_day" with "4"
	And I fill in "birthday_month" with "August"
	And I fill in "birthday_year" with "1961"
	And I fill in "sex" with "Male"
	And I press "Save"
	Then I should be on the person page for "Barack Obama" who is a male with birthday "August 4 1961"
