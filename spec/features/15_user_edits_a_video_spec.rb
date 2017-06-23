require "rails_helper"

feature "visitors can edit a video" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
  let!(:video) { FactoryGirl.create(:video, user: user) }

  scenario "from a link on the nbafinal show page if logged in" do
    login_as(user)
    visit root_path
    expect(page).to have_content(nbafinal.year)
    click_link('2008')
    fill_in "Video", with: "https://www.youtube.com/embed/uqf13CnVVSo"
    click_button "Submit Video"
    click_link "Edit Video"
    expect(page).to have_content "Edit Video"
  end

  scenario "and successfully update the database and be redirected to the show page" do
    login_as(user)
    visit root_path
    expect(page).to have_content(nbafinal.year)
    click_link('2008')
    fill_in "Video", with: "https://www.youtube.com/embed/uqf13CnVVSo"
    click_button "Submit Video"
    click_link "Edit Video"
    fill_in "Video", with: "https://www.youtube.com/watch?v=C5EJ6GCxiDk"
    click_button "Submit Video"

    expect(page).to have_content "Your video is successfully saved!"
  end

  scenario "only if they are logged in" do
    visit nbafinal_path(nbafinal)
    expect(page).to_not have_content "Edit Video"
  end
end
