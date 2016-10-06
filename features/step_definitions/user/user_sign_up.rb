When(/^User visits sign up page/) do
  visit fluent.new_user_registration_path
end

When(/^Fills in the 'Sign Up' form's fields with credentials \((.+):(.+)\)$/) do |email, password|
  fill_in 'user_email', id: 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password
  click_button  I18n.t('user.sign_up')
end

Then(/^He should have ability to sign in with (.+):(.+)$/) do |email, password|
  sign_in email, password
end