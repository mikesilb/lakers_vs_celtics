require "rails_helper"

feature "visitors can delete their own image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game) }

  scenario "from a button on the review edit page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Image", with: "http://www.eurweb.com/wp-content/uploads/2010/06/Ron-Artest.jpg"
    click_button "Submit Image"
    expect(page).to have_xpath("//img[@src='http://www.eurweb.com/wp-content/uploads/2010/06/Ron-Artest.jpg']")
    click_link "Delete Image"
    expect(page).to have_content game.score
    expect(page).to_not have_xpath("//img[@src='http://www.eurweb.com/wp-content/uploads/2010/06/Ron-Artest.jpg']")
  end
end
