require "rails_helper"

feature "visitor can view the listed NBA finals" do
  let!(:admin)  { FactoryGirl.create(:user, role: "admin") }
  let!(:nbafinal)  { FactoryGirl.create(:nbafinal) }

  scenario "from the root path" do
    visit nbafinals_path
    expect(page).to have_content nbafinal.year
  end
end
