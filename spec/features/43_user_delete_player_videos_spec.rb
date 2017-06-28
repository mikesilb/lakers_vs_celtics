require "rails_helper"

feature "user can delete video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:player) { FactoryGirl.create(:player) }

  scenario "from the player show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    click_link('Kobe Bryant')
    fill_in "Video", with: "https://www.youtube.com/embed/henTzv7P5oc"
    click_button "Submit Video"
    expect(page).to have_xpath("//iframe[@src='https://www.youtube.com/embed/henTzv7P5oc']")
    click_on "Delete Video"
    expect(page).to_not have_xpath("//iframe[@src='https://www.youtube.com/embed/henTzv7P5oc']")
  end
end
