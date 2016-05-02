require "test_helper"

feature "Signing in" do
  before do
    signup_and_login # Login happens as part of signup process
    logout
  end

  scenario "logging in" do
    login
    page.must_have_content "Grocery Tracker App"
    page.must_have_content default_username
  end
end
