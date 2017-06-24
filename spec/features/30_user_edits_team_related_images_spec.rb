require "rails_helper"

feature "visitors can edit a image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:team) { FactoryGirl.create(:team)}

  scenario "from a link on the team show page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Image", with: "http://www.basketwallpapers.com/Images-07/LA-Lakers-2010-Roster-Widescreen-Wallpaper.jpg"
    click_button "Submit Image"
    click_on "Edit Image"
    expect(page).to have_content "Edit Image"
  end

  scenario "and successfully update the database and be redirected to the team show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Image", with: "http://www.basketwallpapers.com/Images-07/LA-Lakers-2010-Roster-Widescreen-Wallpaper.jpg"
    click_button "Submit Image"
    click_on "Edit Image"
    expect(page).to have_content "Edit Image"
    fill_in "Image", with: "http://nbahoopsonline.com/teams/LosAngelesLakers/History/Championships/10lakers.jpg"
    click_button "Submit Image"
    expect(page).to have_content "Your image is successfully saved!"
  end

  scenario "only if they are logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Image", with: "http://nbahoopsonline.com/teams/LosAngelesLakers/History/Championships/10lakers.jpg"
    click_button "Submit Image"
    click_link "Logout"
    expect(page).to_not have_content "Edit Image"
  end
 end
