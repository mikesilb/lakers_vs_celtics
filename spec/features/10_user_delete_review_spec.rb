require "rails_helper"

feature "visitors can delete their own review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
  let!(:review)  { FactoryGirl.create(:review, user: user, nbafinal: nbafinal) }

  scenario "from a button on the review edit page if logged in" do
    login_as(user)
    visit root_path

    first(:link, nbafinal.year).click
    click_link "Edit Review"
    click_link "Delete Review"

    expect(page).to have_content nbafinal.year
    expect(page).to_not have_content review.body
  end
end
