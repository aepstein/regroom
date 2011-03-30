@dockets
Feature: Dockets
  In order to have dockets on my website
  As an administrator
  I want to manage dockets

  Background:
    Given I am a logged in refinery user
    And I have no dockets

  @dockets-list @list
  Scenario: Dockets List
   Given I have dockets titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of dockets
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @dockets-valid @valid
  Scenario: Create Valid Docket
    When I go to the list of dockets
    And I follow "Add New Docket"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 docket

  @dockets-invalid @invalid
  Scenario: Create Invalid Docket (without name)
    When I go to the list of dockets
    And I follow "Add New Docket"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 dockets

  @dockets-edit @edit
  Scenario: Edit Existing Docket
    Given I have dockets titled "A name"
    When I go to the list of dockets
    And I follow "Edit this docket" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of dockets
    And I should not see "A name"

  @dockets-duplicate @duplicate
  Scenario: Create Duplicate Docket
    Given I only have dockets titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of dockets
    And I follow "Add New Docket"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 dockets

  @dockets-delete @delete
  Scenario: Delete Docket
    Given I only have dockets titled UniqueTitleOne
    When I go to the list of dockets
    And I follow "Remove this docket forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 dockets
 