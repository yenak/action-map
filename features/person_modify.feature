Feature: A new person can be added to the database and modified.

  As an administrator
  So that I can update the representatives inside the database
  I want to be able to add new representatives and modify old ones.

Scenario: add new representative
	Given I am on the new person page
	And I fill in "person[name]" with "Barack Obama"
	And I select "1961" for "person_birthday_1i"
	And I select "August" for "person_birthday_2i"
	And I select "4" for "person_birthday_3i"
	And I select "Male" for "person_sex"
	When I press "Save"
	Then I should be directed to the person page for "Barack Obama" who is a "Male" with birthday "August 4 1961", email "", phone number "", and description ""

Scenario: modify an existing representative
	Given there is a person named "Barack Obama" who is a "Male" with birthday "August 4 1961", email "bobama@gmail.com", phone number "1800-333-3333", and description ""
	And I should be directed to the person page for "Barack Obama" who is a "Male" with birthday "August 4 1961", email "bobama@gmail.com", phone number "1800-333-3333", and description ""
	When I select "1960" for "person_birthday_1i"
	And I press "Save"
	Then I should be directed to the person page for "Barack Obama" who is a "Male" with birthday "August 4 1960", email "bobama@gmail.com", phone number "1800-333-3333", and description ""
	And there is no person named "Barack Obama" who is a "Male" with birthday "August 4 1961" 1961", email "bobama@gmail.com", phone number "1800-333-3333", and description ""