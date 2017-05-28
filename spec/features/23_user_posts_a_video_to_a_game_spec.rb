require "rails_helper"

feature "user can post video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }

  scenario "from the game show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Video", with: "https://www.youtube.com/embed/7NA8buIS_2k"
    click_button "Submit Video"
    expect(page).to have_content("Your video is successfully saved!")
  end

  scenario "Video is not provided and video is not saved" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    click_button "Submit Video"
    expect(page).to have_content("Video can't be blank")
    expect(page).to_not have_content("Your video is successfully saved!")
  end
end
