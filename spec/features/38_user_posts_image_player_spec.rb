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
    fill_in "Image", with: "https://i.ytimg.com/vi/OMOEDe48-nE/maxresdefault.jpg"
    click_button "Submit Image"
    expect(page).to have_content("Your image is successfully saved!")
  end
  scenario "from the player's show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    click_link('Kobe Bryant')
    click_button "Submit Image"
    expect(page).to have_content("Image can't be blank")
    expect(page).to_not have_content("Your image is successfully saved!")
  end
end
