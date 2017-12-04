Feature: Look at different maps for each topic
  
  As a concerned activist
  So that I can see activity in the topic I care about
  I want to navigate between different maps for states and the country.


Scenario: Visit state activity in a topic from the national Map
	Given I am on the home page
	And I follow "Gun Control Map"
	Then I should see "gun control policies"