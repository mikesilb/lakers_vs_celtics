require "rails_helper"

feature "user can post review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }

  scenario "from the game show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Image", with: "http://www.eurweb.com/wp-content/uploads/2010/06/Ron-Artest.jpg"
    click_button "Submit Image"
    expect(page).to have_content("Your image is successfully saved!")
  end

  scenario "Image is not provided and image is not saved" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    click_button "Submit Image"
    expect(page).to have_content("Image can't be blank")
    expect(page).to_not have_content("Your image is successfully saved!")
  end
end
