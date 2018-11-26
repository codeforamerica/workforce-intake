require "rails_helper"

RSpec.feature "create a simple application for workforce services" do
  scenario "with a minimal situation" do
    visit "/"

    fill_in "What is your email?", with: "user@example.com"
    fill_in "What is your phone number?", with: "1234567890"
    fill_in "How many people do you live with and share money with?", with: "2"
    fill_in "How much money do you make each month?", with: "2000"

    click_on "Continue"

    expect(page.text).to include "Workforce application was successfully created."
  end
end