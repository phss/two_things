Feature: Submitting entries
  In order to entretain the world with my wisdom
  As a vain user
  I want to be able to submit two things entries

  Scenario: Submitting a complete entry
    Given no saved entries
     And I visit the home page
    When I submit a new entry with  
      | topic    | first            | second           | source  | link                         |
      | entering | entering is hard | entering is easy | awesome | http://enter.the.dragon.com  |    
    Then I should see displayed the following entries
      | topic    | first            | second           | source  | link                         |
      | entering | entering is hard | entering is easy | awesome | http://enter.the.dragon.com  |          

  Scenario: Submitting a minimal entry
    Given no saved entries
     And I visit the home page
    When I submit a new entry with  
      | topic    | first            | second        |
      | minimal  | this has less    | less is more  |          
    Then I should see displayed the following entries
      | topic    | first            | second        | source | link |
      | minimal  | this has less    | less is more  |        |      |          

  Scenario: Submitting an entry with missing fields
    Given no saved entries
     And I visit the home page
    When I submit a new entry with  
      | topic    | first | second |
      |          |       |        |          
    Then I should see following validation errors
      | Topic cannot be blank        |
      | First thing cannot be blank  |
      | Second thing cannot be blank |

