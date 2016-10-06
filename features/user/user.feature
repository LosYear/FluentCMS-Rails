Feature: User sign in
  In order to use the application
  As user
  I want users to have ability to sign in

Scenario: User sign in
  Given User not authenticated
    And Existing admin user
  When User visits sign in page
    And Fills in the 'Sign in' form's fields with credentials (admin@admin.cms:password1)
  Then He should be signed in

Scenario: Users signs in with wrong credentials
  Given User not authenticated
  When User visits sign in page
  And Fills in the 'Sign in' form's fields with credentials (wrong@email.cms:password1)
  Then He should not be signed in

Scenario: User navigates to administration panel
  Given User not authenticated
    And Existing admin user
    And I'm signed in as administrator
  When User visits admin's panel page
  Then He should be signed in
    And He should be at admin's panel page

Scenario: Unauthorized user visits administration panel
  Given User not authenticated
    And Existing user
    And I'm signed in as user
  When User visits admin's panel page
  Then He should not be at admin's panel page

Scenario: Signed out user visits administration panel
  Given User not authenticated
  When User visits admin's panel page
  Then He should not be at admin's panel page