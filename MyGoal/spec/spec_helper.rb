RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
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
