require "rails_helper"

feature "user signs out" do
  let!(:user) { FactoryGirl.create(:user) }
  scenario "a logged in user successfully logs out" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log In"
    click_link "Logout"

    expect(page).to have_content("Signed out successfully.")
    expect(page).to_not have_content("Logged in as")
  end
end
