require "rails_helper"

feature "user can post video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:player) { FactoryGirl.create(:player) }

  scenario "from the player show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    expect(page).to have_content("Kobe Bryant")
    click_link('Kobe Bryant')
    fill_in "Video", with: "https://www.youtube.com/embed/MOGKLDwVefs"
    click_button "Submit Video"
    click_on "Edit Video"
    expect(page).to have_content "Edit Video"
  end
  scenario "from the player show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    click_link('Kobe Bryant')
    fill_in "Video", with: "https://www.youtube.com/embed/MOGKLDwVefs"
    click_button "Submit Video"
    click_on "Edit Video"
    fill_in "Video", with: "https://www.youtube.com/embed/henTzv7P5oc"
    click_button "Submit Video"
    expect(page).to have_content("Your video is successfully saved!")
  end
  scenario "only if they are logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    click_link('Kobe Bryant')
    fill_in "Video", with: "https://www.youtube.com/embed/AKpMXh48gSk"
    click_button "Submit Video"
    click_link "Logout"
    expect(page).to_not have_content "Edit Video"
  end
end
