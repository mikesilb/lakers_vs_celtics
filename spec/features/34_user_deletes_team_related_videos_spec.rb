require "rails_helper"

feature "visitors can delete their own video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:team) { FactoryGirl.create(:team) }

  scenario "from a button on the review edit page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Video", with: "https://www.youtube.com/embed/AKpMXh48gSk"
    click_button "Submit Video"
    expect(page).to have_xpath("//iframe[@src='https://www.youtube.com/embed/AKpMXh48gSk']")
    click_link "Delete Video"
    expect(page).to have_content team.teamname
    expect(page).to_not have_xpath("//iframe[@src='https://www.youtube.com/embed/AKpMXh48gSk']")
  end
end
