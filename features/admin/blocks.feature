Feature: Blocks management
  As site's administrator
  In order to simplify frontend content management
  Administrator should be able to manage blocks

  Background:
    Given User not authenticated
      And Existing admin user
      And I'm signed in as administrator


  Scenario Outline: Block creation
    When Administrator visits 'Create block' page
      And Fills in the block form with <title>, <name>, <type>, <content>, <status>
    Then Block should <error> be created

    Examples:
      | title      | name       | type | content           | status | error |
      | Test title | test_block | HTML | Some test content | true   | no    |
      |            | block_name | HTML |                   | false  | yes   |
      | Test title | block_name |      |                   | false  | yes   |

  Scenario Outline: Block update
    Given Existing block
    When Administrator visits 'Update block' page
      And Fills in the block form with <title>, <name>, <type>, <content>, <status>
    Then Block should <error> be updated with following data: <title>, <name>, <type>, <content>, <status>

    Examples:
      | title         | name     | type | content     | status | error |
      | Updated title | new_name | HTML | New content | false  | no    |
      |               | new_name | HTML |             | true   | yes   |
      | New title     | new_name | HTML |             | true   | yes   |

  Scenario: Block destroy
    Given Existing block
    When Administrator visits 'Manage blocks' page
      And Clicks 'Delete block' button
    Then Block should be destroyed