require "rails_helper"

feature "user can post video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:team) { FactoryGirl.create(:team) }

  scenario "from the game show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Video", with: "https://www.youtube.com/embed/AKpMXh48gSk"
    click_button "Submit Video"
    expect(page).to have_content("Your video is successfully saved!")
  end

  scenario "Video is not provided and video is not saved" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    click_button "Submit Video"
    expect(page).to have_content("Video can't be blank")
    expect(page).to_not have_content("Your video is successfully saved!")
  end
end
