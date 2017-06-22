require "rails_helper"

feature "visitors can delete their own review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
  let!(:review)  { FactoryGirl.create(:review, user: user, nbafinal_id: nbafinal) }

  scenario "from a button on the review edit page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    select(4, from: "Rating")
    fill_in "Review", with: "This is great!"
    click_button "Submit Review"
    click_link "Delete Review"

    expect(page).to have_content nbafinal.year
    expect(page).to_not have_content review.body
  end
end
