require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  let!(:list) { create(:list) }
  let!(:task1) { create(:task) }
  let!(:task2) { create(:task, title: "go bike riding", completed: true) }

  before(:each) do
    list.tasks << [task1, task2]
  end

  it "displays all of the tasks for a given list" do
    visit root_path
    click_link_or_button list.title
    within(".incomplete-tasks") do
      expect(page).to have_content("clean the kitchen")
    end
    within(".complete-tasks") do
      expect(page).to have_content("go bike riding")
    end
  end

  it "has a link to add a new task" do
    visit list_path(list.id)
    within(".new-task") do
      expect(page).to have_content("Create New Task")
    end
  end

  it "can create new tasks connected to a To Do list" do
    visit list_path(list.id)
    within(".new-task") do
      click_link_or_button "Create New Task"
    end

    within(".new_task_form") do
      fill_in "task[title]", with: "Go to dance practice"
      fill_in "task[due]", with: "5/7/15"
      click_link_or_button "Create Task"
    end
    within("#flash_notice") do
      expect(page).to have_content("Task successfully created")
    end
  end
end
