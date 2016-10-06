Feature: Pages management
  As site's administrator
  In order to simplify frontend content management
  Administrator should be able to manage pages

  Background:
    Given User not authenticated
    And Existing admin user
    And I'm signed in as administrator

  Scenario Outline: Page creation
    When Administrator visits 'Create page' page
    And Fills in the page form with <title>, <slug>, <content>, <status>
    Then Page <result> be created

    Examples:
      | title      | slug      | content      | status | result     |
      | Test title | page_slug | Test content | true   | should     |
      | Test title |           | Test content | true   | should not |
      |            |           | Test content | true   | should not |
      | Title      | test-page | Content      | true   | should     |

  Scenario Outline: Page update
    Given Existing published page with slug 'test_slug'
    When Administrator visits 'Update page' page
    And Fills in the page form with <title>, <slug>, <content>, <status>
    Then Page <result> be updated with following data: <title>, <slug>, <content>, <status>

    Examples:
      | title         | slug     |  content     | status | result     |
      | Updated title | new_name |  New content | false  | should     |
      |               | new_name |              | true   | should not |
      | New title     | new_name |              | true   | should not |

  Scenario: Page destroy
    Given Existing published page with slug 'test_slug'
    When Administrator visits 'Manage pages' page
    And Clicks 'Delete page' button
    Then Page should be destroyed

  Scenario: Page shouldn't be created with non uniq slug
    Given Existing published page with slug 'existing_slug'
    When Administrator visits 'Create page' page
    And Fills in the page form with Title, existing_slug, Test, true
    Then Page should not be created

  Scenario: User can visit created published page
    Given Existing published page with slug 'published_slug'
    Then User should be able to visit 'published_slug.html'