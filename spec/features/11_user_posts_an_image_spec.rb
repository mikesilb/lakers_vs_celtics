require "rails_helper"

feature "user can post image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }

  scenario "from the nbafinal show page" do
    login_as(user)
    visit root_path
    expect(page).to have_content(nbafinal.year)
    click_link('2008')
    fill_in "Image", with: "http://a.espncdn.com/photo/2009/1208/pg2_2008celtics_576.jpg"
    click_button "Submit Image"
    expect(page).to have_content("Your image is successfully saved!")
  end

  scenario "Image is not provided and image is not saved" do
    login_as(user)
    visit root_path
    expect(page).to have_content(nbafinal.year)
    click_link('2008')
    click_button "Submit Image"
    expect(page).to have_content("Image can't be blank")
    expect(page).to_not have_content("Your image is successfully saved!")
  end
end
