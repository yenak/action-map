Feature: The navigation bar should allow me to navigate through the website

Scenario: I can visit the immigration maps page
  Given I am on the home page
  When I follow "Immigration Map"
  Then I should be on the home page

Scenario: I can visit the gun control maps page
  Given I am on the home page
  When I follow "Gun Control"
  Then I should be on the home page

Scenario: I can visit the environment maps page
  Given I am on the home page
  When I follow "Environment Map"
  Then I should be on the home page

Scenario: I can visit the events page
  Given I am on the home page
  When I follow "Events"
  Then I should be on the events page

Scenario: I can visit the representatives page
  Given I am on the home page
  When I follow "Representatives"
  Then I should be on the representatives page

