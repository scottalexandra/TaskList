require 'rails_helper'

RSpec.feature "Lists", type: :feature do
  let!(:list) { create(:list) }

  it "shows a list of all available lists" do
    visit root_path
    within(".lists-list") do
      expect(page).to have_content("To Do Lists")
    end
  end

  it "allows you to add a new to do list" do
    visit root_path
    click_link_or_button "New List"
    fill_in "list[title]", with: "Eat lots of fried food"
    click_link_or_button "Create List"

    within("#flash_notice") do
      expect(page).to have_content("List successfully created")
    end
  end

  it "have a link that you can click to see its details" do
    visit root_path
    within(".lists-list") do
      click_link_or_button list.title
    end
    expect(current_path).to eq(list_path(list.id))
    expect(page).to have_content("Tasks for #{list.title}")
  end

end
