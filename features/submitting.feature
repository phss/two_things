Feature: Submitting entries
  In order to entretain the world with my wisdom
  As a vain user
  I want to be able to submit two things entries

  Background:
    Given no saved entries

  Scenario: Submitting an entry with all fields
    Given today is 30 Jul 2011
    When I submit a new entry with  
      | topic    | first            | second           | created_by  | source                       |
      | entering | entering is hard | entering is easy | awesome     | http://enter.the.dragon.com  |    
    Then I should see displayed the following entries
      | topic    | first            | second           | meta                                                            |
      | entering | entering is hard | entering is easy | By awesome on 30 Jul 2011. Source: http://enter.the.dragon.com  |          

  Scenario: Submitting an entry with only required fields
    When I submit a new entry with  
      | topic    | first            | second        |
      | minimal  | this has less    | less is more  |          
    Then I should see displayed the following entries
      | topic    | first            | second        |
      | minimal  | this has less    | less is more  |

  Scenario: Submitting an entry without any field
    When I submit a new entry with  
      | topic    | first | second |
      |          |       |        |          
    Then I should see following validation errors
      | Topic cannot be blank        |
      | First thing cannot be blank  |
      | Second thing cannot be blank |

