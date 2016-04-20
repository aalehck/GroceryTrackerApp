require "test_helper"

feature "Home Page" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Grocery Tracker App"
  end
end
