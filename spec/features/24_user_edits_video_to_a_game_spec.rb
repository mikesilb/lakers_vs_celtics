require "rails_helper"

feature "visitors can edit a video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game)}

  scenario "from a link on the game show page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Video", with: "https://www.youtube.com/embed/7NA8buIS_2k"
    click_button "Submit Video"
    click_on "Edit Video"
    expect(page).to have_content "Edit Video"
  end

  scenario "and successfully update the database and be redirected to the game show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Video", with: "https://www.youtube.com/embed/bkvoqwzP_98"
    click_button "Submit Video"
    click_on "Edit Video"
    expect(page).to have_content "Edit Video"
    fill_in "Video", with: "https://www.youtube.com/embed/7NA8buIS_2k"
    click_button "Submit Video"
    expect(page).to have_content "Your video is successfully saved!"
  end

  scenario "only if they are logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Video", with: "http://www.eurweb.com/wp-content/uploads/2010/06/Ron-Artest.jpg"
    click_button "Submit Video"
    click_link "Logout"
    expect(page).to_not have_content "Edit Video"
  end
end
