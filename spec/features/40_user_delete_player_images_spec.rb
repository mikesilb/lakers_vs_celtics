feature "visitors can delete their own image" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:player) { FactoryGirl.create(:player) }

  scenario "from a button on the image show page if logged in" do
    login_as(user)
    visit root_path
    click_link('2010')
    click_link('Los Angeles Lakers')
    expect(page).to have_content("Kobe Bryant")
    click_link('Kobe Bryant')
    fill_in "Image", with: "https://i.ytimg.com/vi/OMOEDe48-nE/maxresdefault.jpg"
    click_button "Submit Image"
    expect(page).to have_xpath("//img[@src='https://i.ytimg.com/vi/OMOEDe48-nE/maxresdefault.jpg']")
    click_on "Delete Image"
    expect(page).to have_content("Kobe Bryant")
    expect(page).to_not have_xpath("//img[@src='https://i.ytimg.com/vi/OMOEDe48-nE/maxresdefault.jpg']")
  end
end
