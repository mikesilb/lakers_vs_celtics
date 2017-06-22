require "rails_helper"

feature "user can post review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:player) { FactoryGirl.create(:player) }

  scenario "from the player's show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    expect(page).to have_content("Kobe Bryant")
    click_link('Kobe Bryant')
    select(5, from: "Rating")
    fill_in "Review", with: "One of the greatest of all time!!"
    click_button "Submit Review"
    click_on "Edit Review"
    expect(page).to have_content "One of the greatest of all time!!"
    expect(page).to have_content "Delete Review"
    click_link "Delete Review"
    expect(page).to have_content player.firstname
    expect(page).to have_content player.lastname
    expect(page).to_not have_content "One of the greatest of all time!!"
  end
end
