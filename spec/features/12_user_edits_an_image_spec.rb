require "rails_helper"

feature "visitors can edit an image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:nbafinal) { FactoryGirl.create(:nbafinal) }
  let!(:image) { FactoryGirl.create(:image, user: user) }

  scenario "from a link on the nbafinal show page if logged in" do
    login_as(user)
    visit root_path
    expect(page).to have_content('2008')
    click_link('2008')
    fill_in "Image", with: "http://a.espncdn.com/photo/2009/1208/pg2_2008celtics_576.jpg"
    click_button "Submit Image"
    click_link "Edit Image"
    expect(page).to have_content "Edit Image"
  end

  scenario "and successfully update the database and be redirected to the show page" do
    login_as(user)
    visit root_path
    expect(page).to have_content('2008')
    click_link('2008')
    fill_in "Image", with: "http://a.espncdn.com/photo/2009/1208/pg2_2008celtics_576.jpg"
    click_button "Submit Image"
    click_link "Edit Image"
    fill_in "Image", with: "http://www.photofile.com/Original/AA/JZ/aajz037.jpg"
    click_button "Submit Image"

    expect(page).to have_content "Your image is successfully saved!"
  end

  scenario "only if they are logged in" do
    visit nbafinal_path(nbafinal)
    expect(page).to_not have_content "Edit Image"
  end
end
