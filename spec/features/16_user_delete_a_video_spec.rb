require "rails_helper"

feature "visitors can delete their own video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
  let!(:video)  { FactoryGirl.create(:video, user: user, nbafinal: nbafinal) }

  scenario "from a button on the video edit page if logged in" do
    login_as(user)
    visit root_path

    first(:link, nbafinal.year).click
    click_link "Edit Video"
    click_link "Delete Video"

    expect(page).to have_content nbafinal.year
    expect(page).to_not have_content video.video
  end
end
