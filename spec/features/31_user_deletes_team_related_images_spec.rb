require "rails_helper"

feature "visitors can delete their own image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:team) { FactoryGirl.create(:team) }

  scenario "from a button on the image show page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    fill_in "Image", with: "http://nbahoopsonline.com/teams/LosAngelesLakers/History/Championships/10lakers.jpg"
    click_button "Submit Image"
    expect(page).to have_xpath("//img[@src='http://nbahoopsonline.com/teams/LosAngelesLakers/History/Championships/10lakers.jpg']")
    click_link "Delete Image"
    expect(page).to have_content team.teamname
    expect(page).to_not have_xpath("//img[@src='http://nbahoopsonline.com/teams/LosAngelesLakers/History/Championships/10lakers.jpg']")
  end
end
