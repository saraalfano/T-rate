Feature: addTranslate

Scenario: Add a Translation:success
      Given I am a PM
      And I am on the home page
      When I follow "ACCEDI"
      Then I should be on the login page
      When I fill in "Email" with "pm@trate.test"
      And I fill in "Password" with "pmpasswordtest"
      And I press "LOG IN"
      Then I should be on the dashboard page
      When I follow "CARICA"
      Then I should be on the translations page
      When I fill in "Titolo" with "file1"
      When I fill in "gg/mm/aaaa" with "19/02/2023"
      When I fill in "2" with "3"
      When I fill in "1" with "2"
      When I upload a file with valid data
      When I press "UPLOAD"
      Then I should be on the dashboard page

Scenario: Add a Translation:failure
      Given I am a PM
      And I am on the home page
      When I follow "ACCEDI"
      Then I should be on the login page
      When I fill in "Email" with "pm@trate.test"
      And I fill in "Password" with "pmpasswordtest"
      And I press "LOG IN"
      Then I should be on the dashboard page
      When I follow "CARICA"
      Then I should be on the translations page
      When I fill in "Titolo" with "file1"
      When I fill in "gg/mm/aaaa" with "19/02/2023"
      When I fill in "2" with "3"
      When I press "UPLOAD"
      Then I should be on the translations page