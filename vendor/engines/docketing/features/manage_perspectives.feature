@docketing_perspectives
Feature: perspectives
  In order to have docket perspectives on my website
  As an administrator
  I want to manage docket perspectives

  Background:
    Given I am a logged in refinery user
    And I have no perspectives

  @focus @docketing_perspectives-list @list
  Scenario: perspectives List
   Given I have perspectives titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of perspectives page
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @docketing_perspectives-valid @valid
  Scenario: Create Valid Docket
    When I go to the admin perspectives page
    And I follow "Add New Docket"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 docket

  @docketing_perspectives-invalid @invalid
  Scenario: Create Invalid Docket (without name)
    When I go to the admin perspectives page
    And I follow "Add New Docket"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 perspectives

  @docketing_perspectives-edit @edit
  Scenario: Edit Existing Docket
    Given a perspective exists with name: "A name"
    When I go to the perspectives_page
    And I follow "Edit this docket" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of perspectives
    And I should not see "A name"

  @docketing_perspectives-duplicate @duplicate
  Scenario: Create Duplicate Docket
    Given I only have perspectives titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of perspectives
    And I follow "Add New Docket"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 perspectives

  @docketing_perspectives-delete @delete
  Scenario: Delete Docket
    Given I only have perspectives titled UniqueTitleOne
    When I go to the list of perspectives
    And I follow "Remove this docket forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 perspectives

