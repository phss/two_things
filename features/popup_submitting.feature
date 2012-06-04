Feature: Submitting entries through popup
  In order to entretain the world with my wisdom
  As a vain user with a modern browser
  I want to be able to submit two things entries through a popup

  Background:
    Given no saved entries

  @javascript
  Scenario: Submitting an entry
    When I submit a new entry with  
      | topic    | first            | second           |
      | entering | entering is hard | entering is easy |
    Then I should see displayed the following entries
      | topic    | first            | second           | 
      | entering | entering is hard | entering is easy |

  @javascript
  Scenario: Submitting an entry without any field
    When I submit a new entry with  
      | topic    | first | second |
      |          |       |        |          
    Then I should see following validation errors
      | Topic cannot be blank        |
      | First thing cannot be blank  |
      | Second thing cannot be blank |
