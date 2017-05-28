require "rails_helper"

feature "visitors can edit a image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:game) { FactoryGirl.create(:game)}

  scenario "from a link on the game show page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Image", with: "http://www.eurweb.com/wp-content/uploads/2010/06/Ron-Artest.jpg"
    click_button "Submit Image"
    click_on "Edit Image"
    expect(page).to have_content "Edit Image"
  end

  scenario "and successfully update the database and be redirected to the game show page" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Image", with: "http://www.eurweb.com/wp-content/uploads/2010/06/Ron-Artest.jpg"
    click_button "Submit Image"
    click_on "Edit Image"
    expect(page).to have_content "Edit Image"
    fill_in "Image", with: "http://www3.pictures.zimbio.com/gi/Kendrick+Perkins+Andrew+Bynum+NBA+Finals+Game+6cazr1WWrBvl.jpg"
    click_button "Submit Image"
    expect(page).to have_content "Your image is successfully saved!"
  end

  scenario "only if they are logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Celtics 89, Lakers 102')
    fill_in "Image", with: "http://www.eurweb.com/wp-content/uploads/2010/06/Ron-Artest.jpg"
    click_button "Submit Image"
    click_link "Logout"
    expect(page).to_not have_content "Edit Image"
  end
end
