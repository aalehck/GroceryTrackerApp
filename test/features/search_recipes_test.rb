require "test_helper"

feature "Searching for Recipes" do
  before do
    signup_and_login

    visit recipes_path
    click_on "Search for a Recipe!"
  end

  scenario "searching by ethnicity" do
    fill_in "Ethnicity", with: "Mexican"
    click_on "Search"

    page.must_have_content "Search Results"
    # TODO Mock search results. Real search results can change, breaking our tests
    page.must_have_content "Kale, Black Bean and Avocado Burrito Bowl"
  end

  scenario "searching by type of diet" do
    fill_in "Type of Diet", with: "Vegan"
    click_on "Search"

    page.must_have_content "Search Results"
    # TODO Mock search results. Real search results can change, breaking our tests
    page.must_have_content "Kale and Quinoa Salad with Black Beans"
  end

  scenario "searching by query" do
    fill_in "Query", with: "Chicken"
    click_on "Search"

    page.must_have_content "Search Results"
    # TODO Mock search results. Real search results can change, breaking our tests
    page.must_have_content "Chicken"
  end
end
