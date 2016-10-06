def create_user(email, password, additional_role_id = nil)
  user = User.new
  user.email = email
  user.password = password
  user.save

  unless additional_role_id.nil?
    user.role_ids = [2] + [additional_role_id]
    user.save
  end
end

def sign_out
  visit fluent.destroy_user_session_path
end

def sign_in (email, password)
  visit fluent.new_user_session_path
  fill_in 'user_email', id: 'user_email', with: email
  fill_in 'user_password', with: password
  click_button  I18n.t('user.sign_in')
end

Given(/^User not authenticated$/) do
  sign_out
end

Given(/^Existing admin user$/) do
  create_user "admin@admin.cms", "password1", 1
end

Given(/^Existing user$/) do
  create_user "user@user.cms", "password1"
end

Given(/^I'm signed in as (.+), (.+)$/) do |email, password|
  sign_in email, password
end

Given(/^I'm signed in as administrator$/) do
  sign_in "admin@admin.cms", "password1"
end

Given(/^I'm signed in as user$/) do
  sign_in "user@user.cms", "password1"
end

When(/^User visits sign in page$/) do
  visit fluent.new_user_session_path
end

When(/^User visits admin's panel page$/) do
  visit fluent.admin_path
end


And(/^Fills in the 'Sign in' form's fields with credentials \((.+):(.+)\)$/) do |email, password|
  sign_in email, password
end

Then(/^He should be signed in$/) do
  expect(page).not_to have_content(I18n.t('devise.failure.invalid'))
end

Then(/^He should not be signed in$/) do
  expect(page).to have_content(I18n.t('devise.failure.invalid'))
end

Then(/^He should be at admin's panel page$/) do
  expect(page).to have_current_path(fluent.admin_path)
end

Then(/^He should not be at admin's panel page$/) do
  expect(page).not_to have_current_path(fluent.admin_path)
end

Then(/^User logouts$/) do
  sign_out
end