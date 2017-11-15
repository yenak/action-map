Feature: A new person can be added to the database and modified.

  As an administrator
  So that I can update the representatives inside the database
  I want to be able to add new representatives and modify old ones.

Scenario: add new representative
	Given I am on the new person page
	And I fill in "fullname" with "Barack Obama"
	And I select "1961" for "person_birth_date_1i"
	And I select "August" for "person_birth_date_2i"
	And I select "4" for "person_birth_date_3i"
	And I select "Male" for "sex"
	When I press "Save"
	Then I should be redirected to the person page for "Barack Obama" who is a "Male" with birthday "August 4 1961"
