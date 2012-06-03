Feature: Viewing entries
  In order to learn new things
  As a curious user
  I want to be able to view two things entries

  Scenario: Viewing a single entry with all fields
    Given the existing entries
      | topic   | first           | second          | created_by | source                 | created_at          |
      | testing | testing is hard | testing is easy | tester     | http://tester.link.com | 2012-04-16 10:51:32 |
    When I visit the home page
    Then I should see displayed the following entries
      | topic   | first           | second          | meta                                                      |
      | testing | testing is hard | testing is easy | By tester on 16 Apr 2012. Source: http://tester.link.com  |

  Scenario: Viewing entries ordered by creation date
    Given the existing entries
      | topic   | first            | second        | created_at          |
      | second  | should be second | should second | 2012-04-16 10:51:32 |
      | first   | should be first  | should first  | 2009-12-30 23:23:23 |
      | third   | should be third  | should third  | 2012-04-16 10:52:32 |
    When I visit the home page
    Then I should see displayed the following entries
      | topic  |
      | first  |
      | second |
      | third  |

  Scenario: Viewing entries without optional fields
    Given the existing entries
      | topic        | first        | second       | created_by | source            | created_at          |
      | no optionals | no optionals | no optionals |            |                   | 2012-01-01 12:00:00 |
      | no creator   | no creator   | no creator   |            | http://no.creator | 2012-02-01 12:00:00 |
      | no source    | no source    | no optionals | no source  |                   | 2012-03-01 12:00:00 |
    When I visit the home page
    Then I should see displayed the following entries
      | topic        | meta                                      |
      | no optionals | On 01 Jan 2012.                           |
      | no creator   | On 01 Feb 2012. Source: http://no.creator |
      | no source    | By no source on 01 Mar 2012.              |
