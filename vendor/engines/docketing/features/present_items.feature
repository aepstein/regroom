@docketing_items
Feature: Publicly Present Docket Items
  In order to review items contained within dockets on my site
  As a visitor to the site
  I want to see items through the public interface

  Background:
    Given A Refinery user exists
    And a docketing_docket: "eobr" exists with name: "Electronic Onboard Recorders"
    And a docketing_docket: "air" exists with name: "Airline Passenger Rights"
    And a docketing_perspective: "issue" exists with name: "Issue"
    And a docketing_perspective: "comment" exists with name: "Comment"
    And a docketing_item: "root" exists with title: "Cost", docket: docketing_docket "eobr", perspective: docketing_perspective "issue"
    And a docketing_item: "child" exists with title: "Calculation", docket: docketing_docket "eobr", parent: docketing_item "root", perspective: docketing_perspective "issue"
    And a docketing_item: "root_comment" exists with title: "Cost is too high", docket: docketing_docket "eobr", parent: docketing_item "root", perspective: docketing_perspective "comment"
    And a docketing_item: "child_comment" exists with title: "Cost overestimated for drivers", docket: docketing_docket "eobr", parent: docketing_item "child", perspective: docketing_perspective "comment"
    And a docketing_item: "alt_root" exists with title: "Privacy", docket: docketing_docket "eobr"

  @docketing_items-show @show
  Scenario: Show an item (with child)
    Given I am on docketing_item: "root" page
    Then I should see "Electronic Onboard Recorders"
    And I should see "Cost"
    And I should see "Calculation"
    And I should not see "Privacy"
    And I should not see "Cost is too high"
    And I should not see "Cost overestimated for drivers"

