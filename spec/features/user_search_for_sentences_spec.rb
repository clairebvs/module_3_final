require 'rails_helper'

feature 'A Guest User' do
  scenario 'fills the search form to get sentences example' do
    word = "mindfulness"

    visit '/'

    fill_in :q, with: word
    click_on 'Submit'

    expect(page).to have_content("Examples for using #{word}")
    expect(page).to have_css(".sentence")
  end
end

# As a guest user (no sign in required)
# When I visit "/"
# And I fill in a text box with "mindfulness"
# And I click "Submit"
# Then I should see a message that says "Examples for using 'mindfulness'"
# And I should see a list of sentences with examples of how to use the word
# And I should see only sentences where the region for usage is "Brittish" or "Canadian"
# And I should not see sentences for any other regions (or blank regions)
