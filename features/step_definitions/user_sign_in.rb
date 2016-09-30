Given(/^User not authenticated$/) do
  visit fluent.destroy_user_session_path
end

Given(/^Existing admin user$/) do
  Fluent::Role.new(id: 1, name: "Admin").save
  Fluent::Role.new(id: 2, name: "Registered").save
  Fluent::Role.new(id: 3, name: "Guest").save

  user = User.new
  user.email = "admin@admin.cms"
  user.password = "password1"
  user.save
end

When(/^User visits sign in page$/) do
  visit fluent.new_user_session_path
end

And(/^Fills in the 'Sign in' form's fields with credentials$/) do
  fill_in 'user_email',id: 'user_email', with: 'admin@admin.cms'
  fill_in 'user_password', with: 'password1'
  click_button  'Sign In'
end

Then(/^He should be signed in$/) do
  expect(page).not_to have_content(I18n.t('devise.failure.invalid'))
end

And(/^Fills in the 'Sign in' form's fields with wrong credentials$/) do
  fill_in 'user_email',id: 'user_email', with: 'admin@admin.cms'
  fill_in 'user_password', with: 'wrong_password'
  click_button  'Sign In'
end

Then(/^He should not be signed in$/) do
  expect(page).to have_content(I18n.t('devise.failure.invalid'))
end