require "rails_helper"

feature "user can post review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:team) { FactoryGirl.create(:team) }

  scenario "from the team's show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    expect(page).to have_content("The 2010 Los Angeles Lakers")
    select(5, from: "Rating")
    fill_in "Review", with: "The team played with a lot of heart in that finals series!"
    click_button "Submit Review"

    expect(page).to have_content("Your review is successfully saved!")
  end

  scenario "Rating is not selected and review is not saved" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')

    fill_in "Review", with: "The team played with a lot of heart in that finals series!"
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
    select(5, from: "Rating")
    click_button "Submit Review"

    expect(page).to have_content("Body can't be blank")
    expect(page).to_not have_content("Your review is successfully saved!")
  end
end
