When(/^Administrator visits 'Create block' page$/) do
  visit fluent.new_admin_block_path
end

And(/^Fills in the block form with (.*), (.*), (.*), (.*), (.*)$/) do |title, name, type, content, status|
  fill_in 'block_title', with: title
  fill_in 'block_name', with: name
  select type, from: 'block_type'
  fill_in 'block_content', with: content
  check 'block_status' if status

  click_button 'block_submit_action'
end

Then(/^Block should (.*) be created$/) do |error|
  if error == 'no'
    expect(page).not_to have_selector(".error")

    unless Fluent::Block.count == 1
      fail("Block wasn't created properly")
    end
  else
    expect(page).to have_selector(".error")

    unless Fluent::Block.count == 0
      fail("Block was created unless errors")
    end
  end
end

Given(/^Existing block$/) do
  block = Fluent::Block.new
  block.name = "test_block"
  block.title = "Block title"
  block.content = "Content"
  block.status = false
  block.type = "html"
  block.save
end

When(/^Administrator visits 'Update block' page$/) do
  visit fluent.edit_admin_block_path(Fluent::Block.first)
end

Then(/^Block should (.*) be updated with following data: (.*), (.*), (.*), (.*), (.*)$/) do |error, title, name, type, content, status|
  if error == 'no'
    expect(page).not_to have_selector(".error")

    count = Fluent::Block.where(title: title, name: name).count

    if count == 0
      fail("Block wasn't updated")
    end
  else
    expect(page).to have_selector(".error")
  end
end

When(/^Administrator visits 'Manage blocks' page$/) do
  visit fluent.admin_blocks_path
end

And(/^Clicks 'Delete block' button$/) do
  find('a[data-original-title=' + I18n.t('backend_part.remove') + ']').click
end

Then(/^Block should be destroyed$/) do
  fail "Block wasn't deleted" if Fluent::Block.count > 0
end