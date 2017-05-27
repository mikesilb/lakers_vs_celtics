require "rails_helper"

feature "visitors can edit a review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game)}

  scenario "from a link on the game show page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    select(4, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    click_on "Edit Review"
    expect(page).to have_content "Edit Review"
  end

  scenario "and successfully update the database and be redirected to the game show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    select(4, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    click_on "Edit Review"
    expect(page).to have_content "Edit Review"
    select(3, from: "Rating")
    fill_in "Review", with: "I have a new found respect for this particular game"
    click_button "Submit Review"

    expect(page).to have_content "I have a new found respect for this particular game"
    expect(page).to have_content "Your review is successfully saved!"
    expect(page).to_not have_content "This just makes me sad."
  end

  scenario "only if they are logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    select(4, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    click_link "Logout"
    expect(page).to_not have_content "Edit Review"
  end

  scenario "and should be shown error message if updated review has no rating" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    select(4, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    click_on "Edit Review"
    expect(page).to have_content "Edit Review"
    select("", from: "Rating")
    fill_in "Review", with: "I have a new found respect for this particular game"
    click_button "Submit Review"

    expect(page).to have_content "Rating can't be blank"
    expect(page).to have_content "Rating is not a number"
    expect(page).to have_content "Edit Review"
    expect(page).to_not have_content "Your review is successfully saved!"
  end

  scenario "and should be shown error message if updated review has no body" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    select(4, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    click_on "Edit Review"
    expect(page).to have_content "Edit Review"
    select(3, from: "Rating")
    fill_in "Review", with: ""
    click_button "Submit Review"

    expect(page).to have_content "Body can't be blank"
    expect(page).to have_content "Edit Review"
    expect(page).to_not have_content "Your review is successfully saved!"
  end
end
