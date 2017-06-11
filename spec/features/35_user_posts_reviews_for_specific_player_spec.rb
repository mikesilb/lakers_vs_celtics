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

    expect(page).to have_content("Your review is successfully saved!")
  end
  scenario "Rating is not selected and review is not saved" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    expect(page).to have_content("Kobe Bryant")
    click_link('Kobe Bryant')
    fill_in "Review", with: "One of the greatest of all time!!"
    click_button "Submit Review"

    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content("Rating is not a number")
    expect(page).to_not have_content("Your review is successfully saved!")
  end

  scenario "Review is not provided and review is not saved" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    expect(page).to have_content("Kobe Bryant")
    click_link('Kobe Bryant')
    select(5, from: "Rating")
    click_button "Submit Review"

    expect(page).to have_content("Body can't be blank")
    expect(page).to_not have_content("Your review is successfully saved!")
  end
end
