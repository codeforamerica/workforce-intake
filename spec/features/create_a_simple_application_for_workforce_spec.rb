require "rails_helper"

RSpec.feature "create a simple application for workforce services" do
  scenario "with a minimal situation" do
    visit new_workforce_application_path

    fill_in "Email", with: "user@example.com"
    fill_in "Phone number", with: "1234567890"
    fill_in "Household size", with: "2"
    fill_in "Earned income", with: "2000"

    click_on "Create Workforce application"

    expect(page.text).to include "Workforce application was successfully created."
  end
end