Feature: Guests can sign up
  In order to login and use the application
  As guest
  I want them to have ability to create their own accounts

Scenario: Guest signs up
  Given User not authenticated
  When User visits sign up page
    And Fills in the 'Sign Up' form's fields with credentials (user@user.cms:password1)
  Then User logouts
    And He should have ability to sign in with user@user.cms:password1
    And He should be signed in