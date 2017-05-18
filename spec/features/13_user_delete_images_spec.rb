require "rails_helper"

feature "visitors can delete their own image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
  let!(:image)  { FactoryGirl.create(:image, user: user, nbafinal: nbafinal) }

  scenario "from a button on the image edit page if logged in" do
    login_as(user)
    visit root_path

    first(:link, nbafinal.year).click
    click_link "Edit Image"
    click_link "Delete Image"

    expect(page).to have_content nbafinal.year
    expect(page).to_not have_content image.image
  end
end
