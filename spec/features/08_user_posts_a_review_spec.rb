require "rails_helper"

feature "user can post review" do
  let!(:user)  { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }

  scenario "from the nbafinal show page" do
    login_as(user)
    visit root_path
    expect(page).to have_content(nbafinal.year)
    click_link('2008')

    select(4, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    expect(page).to have_content("Your review is successfully saved!")
  end

  scenario "Rating is not selected and review is not saved" do
    login_as(user)
    visit root_path

    expect(page).to have_content(nbafinal.year)

    first(:link, nbafinal.year).click
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"

    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content("Rating is not a number")

    expect(page).to_not have_content("Your review is successfully saved!")
  end

  scenario "Review is not provided and review is not saved" do
    login_as(user)
    visit root_path

    expect(page).to have_content(nbafinal.year)

    first(:link, nbafinal.year).click
    select(4, from: "Rating")
    click_button "Submit Review"

    expect(page).to have_content("Body can't be blank")
    expect(page).to_not have_content("Your review is successfully saved!")
  end
end
