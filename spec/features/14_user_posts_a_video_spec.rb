require "rails_helper"

feature "user can post image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }

  scenario "from the nbafinal show page" do
    login_as(user)
    visit root_path
    expect(page).to have_content(nbafinal.year)
    click_link('2008')
    fill_in "Video", with: "https://www.youtube.com/watch?v=C5EJ6GCxiDk"
    click_button "Submit Video"
    expect(page).to have_content("Your video is successfully saved!")
  end

  scenario "Video is not provided and video is not saved" do
    login_as(user)
    visit root_path
    expect(page).to have_content(nbafinal.year)
    click_link('2008')
    click_button "Submit Video"
    expect(page).to have_content("Video can't be blank")
    expect(page).to_not have_content("Your video is successfully saved!")
  end
end
