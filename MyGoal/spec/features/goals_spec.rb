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
