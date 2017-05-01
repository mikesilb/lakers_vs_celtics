require "rails_helper"
# require_relative "../factories/user_factory"
# require_relative "../factories/color_factory"
# require_relative "../factories/review_factory"

feature "visitor can view the details of a specific NBA Finals" do
  # let!(:user)   { FactoryGirl.create(:user) }
  let!(:nbafinal)  { FactoryGirl.create(:nbafinal) }
  # let!(:review) { FactoryGirl.create(:review, user: user, color: color) }

  scenario "from the individual NBA Finals show page" do
    visit nbafinal_path(nbafinal)

    expect(page).to have_content nbafinal.year
    expect(page).to have_content nbafinal.num_games
    expect(page).to have_content nbafinal.champion
  end

  scenario "by clicking the specific link on the index page" do
    visit nbafinals_path
    first(:link, nbafinal.year).click

    expect(page).to have_content nbafinal.year
    expect(page).to have_content nbafinal.num_games
    expect(page).to have_content nbafinal.champion
  end

  scenario "and can get back to index page" do
    visit nbafinals_path
    first(:link, nbafinal.year).click
    click_link "NBA Finals Index Page"

    expect(page).to have_content nbafinal.year
  end
end
