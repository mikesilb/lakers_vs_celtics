require "rails_helper"

feature "user can post image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:team) { FactoryGirl.create(:team) }

  scenario "from the game show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Image", with: "http://nbahoopsonline.com/teams/LosAngelesLakers/History/Championships/10lakers.jpg"
    click_button "Submit Image"
    expect(page).to have_content("Your image is successfully saved!")
  end

  scenario "Image is not provided and image is not saved" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    click_button "Submit Image"
    expect(page).to have_content("Image can't be blank")
    expect(page).to_not have_content("Your image is successfully saved!")
  end
end
