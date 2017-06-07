require "rails_helper"

feature "visitors can delete their own review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:team) { FactoryGirl.create(:team) }

  scenario "from a button on the review edit page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    select(5, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    expect(page).to have_content "This is great!"
    click_link "Delete Review"
    expect(page).to have_content team.teamname
    expect(page).to_not have_content "This is great!"
  end
end
