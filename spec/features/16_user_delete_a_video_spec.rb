require "rails_helper"

feature "visitors can delete their own video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
  let!(:video)  { FactoryGirl.create(:video, user: user) }

  scenario "from a button on the video edit page if logged in" do
    login_as(user)
    visit root_path
    expect(page).to have_content('2008')
    click_link('2008')
    fill_in "Video", with: "https://www.youtube.com/embed/uqf13CnVVSo"
    click_button "Submit Video"
    click_link "Delete Video"

    expect(page).to have_content('2008')
    expect(page).to_not have_content video.video
  end
end
