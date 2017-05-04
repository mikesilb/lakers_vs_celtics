# require "rails_helper"
#
# feature "Admins can add a new NBA Final series" do
#
#   let!(:admin)  { FactoryGirl.create(:user, role: "admin") }
#   let!(:nbafinal)  { FactoryGirl.create(:nbafinal) }
#
#   scenario "from a link on the root path if they are logged in" do
#     login_as(admin)
#     visit nbafinals_path
#
#     click_link "Add new NBA Finals series"
#     expect(page).to have_content "New NBA Finals"
#   end
#
#   scenario "and can see the result on the Index page without MVP" do
#     login_as(admin)
#     visit nbafinals_path
#
#     click_link "Add new NBA Finals series"
#     fill_in "Year", with: "2008"
#     fill_in "Number of Games", with: 6
#     fill_in "NBA Champion", with: "Celtics"
#     click_button "Add Finals series"
#     expect(page).to have_content "Finals added successfully"
#     expect(page).to have_content "2008"
#   end
#
#   scenario "and can see the result on the Show page without MVP" do
#     login_as(admin)
#     visit nbafinals_path
#
#     click_link "Add new NBA Finals series"
#     fill_in "Year", with: "2008"
#     fill_in "Number of Games", with: 6
#     fill_in "NBA Champion", with: "Celtics"
#     click_button "Add Finals series"
#     expect(page).to have_content "Finals added successfully"
#     expect(page).to have_content "2008"
#     expect(page).to have_content "Celtics"
#   end
#
#   scenario "and can see the result on the Show page with MVP" do
#     login_as(admin)
#     visit nbafinals_path
#
#     click_link "Add new NBA Finals series"
#     fill_in "Year", with: "2008"
#     fill_in "Number of Games", with: 6
#     fill_in "NBA Champion", with: "Celtics"
#     fill_in "MVP", with: "Paul Pierce"
#
#     click_button "Add Finals series"
#     expect(page).to have_content "Finals added successfully"
#     expect(page).to have_content "2008"
#     expect(page).to have_content "Celtics"
#     expect(page).to have_content "Paul Pierce"
#   end
# end
#
# feature "Admins can add a new NBA Final series" do
#
#   let!(:admin) { FactoryGirl.create(:user, role: "admin") }
#   let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
#
#   scenario "but are not able to enter a Finals Year already in the database" do
#     login_as(admin)
#     visit nbafinals_path
#
#     click_link "Add new NBA Finals series"
#     fill_in "Year", with: "2010"
#     fill_in "Number of Games", with: 7
#     fill_in "NBA Champion", with: "Lakers"
#     click_button "Add Finals series"
#     expect(page).to have_content "Year has already been taken"
#   end
#
#   scenario "but are not able to leave the year blank" do
#     login_as(admin)
#     visit nbafinals_path
#
#     click_link "Add new NBA Finals series"
#     fill_in "Number of Games", with: 6
#     fill_in "NBA Champion", with: "Celtics"
#     click_button "Add Finals series"
#     expect(page).to have_content "Year can't be blank"
#   end
#
#   scenario "but are not able to leave the number of games blank" do
#     login_as(admin)
#     visit nbafinals_path
#
#     click_link "Add new NBA Finals series"
#     fill_in "Year", with: "2008"
#     fill_in "NBA Champion", with: "Celtics"
#     click_button "Add Finals series"
#     expect(page).to have_content "Numgames can't be blank"
#   end
#
#   scenario "only if they are logged in" do
#     visit nbafinals_path
#     expect(page).to_not have_content "Add new NBA Finals series"
#   end
# end
#
# feature "Users cannot add a new NBA Final series" do
#
#   let!(:user)  { FactoryGirl.create(:user) }
#   let!(:nbafinal)  { FactoryGirl.create(:nbafinal) }
#
#   scenario "from a link on the root path if they are logged in" do
#     login_as(user)
#     visit nbafinals_path
#     expect(page).to_not have_content "Add new NBA Finals series"
#   end
# end
