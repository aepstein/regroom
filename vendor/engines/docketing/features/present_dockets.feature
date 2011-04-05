@docketing_dockets
Feature: Publicly Present Dockets
  In order to review dockets on my website
  As a visitor to the site
  I want to see documents through the public interface

  Background:
    Given A Refinery user exists
    And a docketing_docket: "eobr" exists with name: "Electronic Onboard Recorders"
    And a docketing_docket: "air" exists with name: "Airline Passenger Rights"

  @docketing_dockets-show @show
  Scenario: Show a docket (with no root items)
    Given I am on docketing_docket: "eobr" page
    Then I should see "Electronic Onboard Recorders" within "#body_content_title"
    And I should see "Select from the following issues:"
    And I should see "There are no issues yet."

  @docketing_dockets-show @show
  Scenario: Show a docket (with root item)
    Given a docketing_item: "root" exists with docket: docketing_docket "eobr", title: "Cost"
    And a docketing_item exists with docket: docketing_docket "eobr", parent: docketing_item "root", title: "Calculation"
    And a docketing_item exists with docket: docketing_docket "air", title: "Other Docket"
    And I am on docketing_docket: "eobr" page
    Then I should see "Cost" within "#docketing_items"
    And I should not see "Calculation" within "#docketing_items"
    And I should not see "Other Docket" within "#docketing_items"
    And I should not see "There are no issues yet."

