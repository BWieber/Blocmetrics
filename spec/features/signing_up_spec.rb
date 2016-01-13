require "rails_helper"

RSpec.feature "users can sign up" do
  scenario "when providing valid details" do
    visit welcome_index_path
    click_link "Sign Up"
    fill_in "Email", with: "test@example.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end
end
