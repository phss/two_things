Feature: Viewing entries
  In order to learn new things
  As a curious user
  I want to be able to view two things entries

  Scenario: Viewing a single entry with all fields
    Given the existing entries
      | topic   | first           | second          | source | link                   |
      | testing | testing is hard | testing is easy | tester | http://tester.link.com |
    When I visit the home page
    Then I should see displayed the following entries
      | topic   | first           | second          | source | link                   |
      | testing | testing is hard | testing is easy | tester | http://tester.link.com |