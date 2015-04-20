RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def sign_up
  visit new_user_url
  fill_in 'Username', :with => 'testing_username'
  fill_in 'Password', :with => 'biscuits'
  click_button "Create User"
end

def sign_up_as_testing_username
  sign_up
end

def log_in
  visit new_session_url
  fill_in 'Username', :with => 'testing_username'
  fill_in 'Password', :with => 'biscuits'
  click_button "Log In"
end

def log_out
  click_button 'Log Out'
end

def make_goal(title = nil, body = nil, scope = 'Private')
  title ||= "Succeed"
  body ||= "Finish App Academy and get job"
  scope ||= 'Public'

  visit new_goal_url
  fill_in 'Title', with: title
  fill_in 'Body', with: body
  choose scope
  click_button "Create New Goal"
end
