require "rails_helper"

feature "visitors can edit a video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:team) { FactoryGirl.create(:team)}

  scenario "from a link on the game show page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Video", with: "https://www.youtube.com/embed/AKpMXh48gSk"
    click_button "Submit Video"
    click_on "Edit Video"
    expect(page).to have_content "Edit Video"
  end

  scenario "and successfully update the database and be redirected to the game show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Video", with: "https://www.youtube.com/embed/MOGKLDwVefs"
    click_button "Submit Video"
    click_on "Edit Video"
    expect(page).to have_content "Edit Video"
    fill_in "Video", with: "https://www.youtube.com/embed/AKpMXh48gSk"
    click_button "Submit Video"
    expect(page).to have_content "Your video is successfully saved!"
  end

  scenario "only if they are logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Video", with: "https://www.youtube.com/embed/AKpMXh48gSk"
    click_button "Submit Video"
    click_link "Logout"
    expect(page).to_not have_content "Edit Video"
  end
end
