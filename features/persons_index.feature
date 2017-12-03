Feature: Visit the representatives page

Background: representatives have been added to database

  Given the following representatives exist:
  | name   | sex   | birthday   | description    | phone_number   | email   		|
  | rep1   | Male  | 2000-01-01 | person1        | 1-111-111-1111 | rep1@gmail.com	|
  | rep2   | Male  | 2000-02-02 | person2        | 2-222-222-2222 | rep2@gmail.com	|
  | rep3   | Male  | 2000-03-03 | person3        | 3-333-333-3333 | rep3@gmail.com	|
  | rep4   | Male  | 2000-04-04 | person4        | 4-444-444-4444 | rep4@gmail.com	|
  | rep5   | Male  | 2000-05-05 | person5        | 5-555-555-5555 | rep5@gmail.com	|

Scenario: see all the representatives
	When I am on the representatives page
	Then I should see "rep1"
	And I should see "rep2"
	And I should see "rep3"
	And I should see "rep4"
	And I should see "rep5"

Scenario: visit a representative
	When I am on the representatives page
	And I follow "rep1"
	Then I should be on the representative page for "rep1"