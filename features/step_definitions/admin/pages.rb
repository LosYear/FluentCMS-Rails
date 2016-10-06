When(/^Administrator visits 'Create page' page$/) do
  visit fluent.new_admin_page_path
end


When(/^Administrator visits 'Manage pages' page$/) do
  visit fluent.admin_pages_path
end


And(/^Fills in the page form with (.*), (.*), (.*), (.*)$/) do |title, slug, content, status|
  fill_in 'page_title', with: title
  fill_in 'page_slug', with: slug
  fill_in 'page_content', with: content
  check 'page_status' if status

  click_button 'page_submit_action'
end

Then(/^Page (.*) be created$/) do |result|
  if result == 'should'
    expect(page).not_to have_selector(".error")

    if Fluent::Page.count < 1
      fail("Page wasn't created properly")
    end
  else
    expect(page).to have_selector(".error")
  end
end

Given(/^Existing (.*) page with slug '(.*)'/) do |status, slug|
  page = Fluent::Page.new
  page.slug = slug
  page.title = "Page title"
  page.content = "Content"
  page.status = (status == 'published')
  page.save
end

When(/^Administrator visits 'Update page' page$/) do
  visit fluent.edit_admin_page_path(Fluent::Page.first)
end

Then(/^Page (.*) be updated with following data: (.*), (.*), (.*), (.*)$/) do |result, title, slug, content, status|
  if result == 'should'
    expect(page).not_to have_selector(".error")

    count = Fluent::Page.where(title: title, slug: slug).count

    if count == 0
      fail("Page wasn't updated")
    end
  else
    expect(page).to have_selector(".error")
  end
end

And(/^Clicks 'Delete page' button$/) do
  find('a[data-original-title=' + I18n.t('backend_part.remove') + ']').click
end

Then(/^Page should be destroyed$/) do
  fail "Block wasn't deleted" if Fluent::Block.count > 0
end

Then(/^User (.*) be able to visit '(.*)'$/) do |result, slug|
  if result == 'should'
    expect(:get => slug).to be_routable
  else
    expect(:get => slug).not_to be_routable
  end
end