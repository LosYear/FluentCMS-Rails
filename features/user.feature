Feature: User sign in
  In order to use the application
  As user
  I want users to have ability to sign in

Scenario: User sign in
  Given User not authenticated
    And Existing admin user
  When User visits sign in page
    And Fills in the 'Sign in' form's fields with credentials
  Then He should be signed in

Scenario: Users signs in with wrong credentials
  Given User not authenticated
  When User visits sign in page
  And Fills in the 'Sign in' form's fields with wrong credentials
  Then He should not be signed in