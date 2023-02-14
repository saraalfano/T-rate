Feature: login

Scenario: Success Login
	  Given I am on the home page
      And I am a registered user
      When I follow "ACCEDI"
      Then I should be on the login page
      When I fill in "Email" with "agnese.krelli@gmail.com"
      And I fill in "Password" with "agnese"
      And I press "Log In"
      Then I should be on the dashboard page