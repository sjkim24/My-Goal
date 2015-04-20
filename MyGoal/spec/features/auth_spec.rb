require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Create User"
  end

  feature "signing up a user" do
    before(:each) do
      sign_up
    end

    scenario "shows Username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end

    scenario "shows homepage after signup" do
      expect(page).to have_content "All Goals"
    end

  end

end

feature "logging in" do

  scenario "has a login page" do
    visit new_session_url
    expect(page).to have_content "Log In"
  end

  feature "logging in a user" do
    before(:each) do
      sign_up
      log_in
    end

    scenario "shows Username on the homepage after login" do
      expect(page).to have_content "testing_username"
    end

    scenario "shows homepage after login" do
      expect(page).to have_content "All Goals"
    end

    scenario "has a logout button on homepage after login" do
      expect(page).to have_content "Log Out"
    end

  end

  feature "incorrect login" do

    scenario "redirects to login page for nonexistent Username" do
      visit new_session_url
      fill_in 'Username', :with => 'testing'
      fill_in 'Password', :with => 'biscuits'
      click_button "Log In"

      expect(page).to have_content "Log In"
      expect(page).to have_content "Username"
      expect(page).to have_content "Password"
    end

    scenario "redirects to login page for incorrect password" do
      visit new_session_url
      fill_in 'Username', :with => 'testing_username'
      fill_in 'Password', :with => 'bis'
      click_button "Log In"

      expect(page).to have_content "Log In"
      expect(page).to have_content "Username"
      expect(page).to have_content "Password"
    end
  end
end

feature "logging out" do

  before(:each) do
    sign_up
    log_in
    click_button "Log Out"
  end

  scenario "begins with logged out state" do
    expect(page).to have_content "Log In"
    expect(page).to have_content "Create User"
  end

  scenario "doesn't show Username on the homepage after logout" do
    visit goals_url
    expect(page).not_to have_content "testing_username"
  end

  scenario "doesn't show logout button after logging out" do
    visit goals_url
    expect(page).not_to have_content "Log Out"
  end

end
