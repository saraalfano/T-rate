Feature: login

Scenario: Success Login
	  Given I am on the home page
      And I am a registered user
      When I follow "ACCEDI"
      Then I should be on the login page
      When I fill in "Email" with "utente@trate.test"
      And I fill in "Password" with "utentepasswordtest"
      And I press "LOG IN"
      Then I should be on the dashboard page