require "rails_helper"

feature "visitors can delete their own video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }

  scenario "from a button on the review edit page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Video", with: "https://www.youtube.com/embed/7NA8buIS_2k"
    click_button "Submit Video"
    expect(page).to have_xpath("//iframe[@src='https://www.youtube.com/embed/7NA8buIS_2k']")
    click_link "Delete Video"
    expect(page).to have_content game.score
    expect(page).to_not have_xpath("//iframe[@src='https://www.youtube.com/embed/7NA8buIS_2k']")
  end
end
