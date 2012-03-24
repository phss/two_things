Feature: Viewing entries
  In order to explore entries
  As a curious user
  I want to be able to view two things entries

  Scenario: Viewing a complete entry
    Given the following saved entries
      | topic   | first           | second          | source | link                   |
      | testing | testing is hard | testing is easy | tester | http://tester.link.com |
      And I visit the home page
    Then I should see displayed the following entries
      | topic   | first           | second          | source | link                   |
      | testing | testing is hard | testing is easy | tester | http://tester.link.com |