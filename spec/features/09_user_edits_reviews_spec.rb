# require "rails_helper"
#
# feature "visitors can edit a review" do
#   let!(:user) { FactoryGirl.create(:user) }
#   let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
#   let!(:review) { FactoryGirl.create(:review, user: user, nbafinal: nbafinal) }
#
#   scenario "from a link on the nbafinal show page if logged in" do
#     login_as(user)
#     visit root_path
#
#     first(:link, nbafinal.year).click
#     click_on "Edit Review"
#     expect(page).to have_content "Edit Review"
#   end
#
#   scenario "and successfully update the database and be redirected to the show page" do
#     login_as(user)
#     visit root_path
#
#     first(:link, nbafinal.year).click
#     click_link "Edit Review"
#
#     select(4, from: "Rating")
#     fill_in "Review", with: "I have a new found respect for this colour"
#     click_button "Submit Review"
#
#     expect(page).to have_content "I have a new found respect for this colour"
#     expect(page).to have_content "Your review is successfully saved!"
#     expect(page).to_not have_content "This just makes me sad."
#   end
#
#   scenario "only if they are logged in" do
#     visit nbafinal_path(nbafinal)
#     expect(page).to_not have_content "Edit Review"
#   end
#
#     scenario "and should be shown error message if updated review has no rating" do
#     login_as(user)
#     visit root_path
#
#     first(:link, nbafinal.year).click
#
#     click_link "Edit Review"
#
#     select("", from: "Rating")
#     fill_in "Review", with: "I have a new found respect for this colour"
#     click_button "Submit Review"
#
#     save_and_open_page
#     expect(page).to have_content "Rating must be between 1 - 5"
#     expect(page).to have_content "Edit Review"
#     expect(page).to_not have_content "Your review is successfully saved!"
#   end
#
#   scenario "and should be shown error message if updated review has no body" do
#     login_as(user)
#     visit root_path
#
#     first(:link, nbafinal.year).click
#
#     click_link "Edit Review"
#
#     select(4, from: "Rating")
#     fill_in "Review", with: ""
#     click_button "Submit Review"
#
#     expect(page).to have_content "Body can't be blank"
#     expect(page).to have_content "Edit Review"
#     expect(page).to_not have_content "Your review is successfully saved!"
#   end
# end
