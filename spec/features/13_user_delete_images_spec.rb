require "rails_helper"

feature "visitors can delete their own image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
  let!(:image)  { FactoryGirl.create(:image, user: user) }

  scenario "from a button on the image edit page if logged in" do
    login_as(user)
    visit root_path
    expect(page).to have_content('2008')
    click_link('2008')
    fill_in "Image", with: "http://a.espncdn.com/photo/2009/1208/pg2_2008celtics_576.jpg"
    click_button "Submit Image"
    click_link "Delete Image"

    expect(page).to have_content('2008')
    expect(page).to_not have_content image.image
  end
end
