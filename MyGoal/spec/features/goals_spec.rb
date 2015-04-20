require 'spec_helper'
require 'rails_helper'

feature "create a goal" do

  before(:each) do
    sign_up
  end

  scenario "has a new goal page" do
    visit(new_goal_url)
    expect(page).to have_content "Create New Goal"
    expect(page).to have_content "Title"
    expect(page).to have_content "Body"
    expect(page).to have_content "Private"
    expect(page).to have_content "Public"
  end

  scenario "creating a goal" do
    visit new_goal_url
    make_goal
    expect(page).to have_content "Succeed"
  end
end

feature "goals index" do
  before(:each) do
    sign_up
    make_goal
    make_goal(title = 'Exercise', body = 'Get healthy!', scope = 'Private')
    log_out
  end

  scenario "shows all public goals" do
    visit goals_url
    expect(page).to have_content "Succeed"
    expect(page).to have_content "testing_username"
  end

  scenario "does not show private goals" do
    visit goals_url
    expect(page).not_to have_content "Exercise"
  end
end

feature "user show page" do
  before(:each) do
    sign_up
    make_goal
    make_goal(title = 'Exercise', body = 'Get healthy!', scope = 'Private')
  end

  scenario "all user's goals show up on show page" do
    expect(page).to have_content "Succeed"
    expect(page).to have_content "Exercise"
  end

end
