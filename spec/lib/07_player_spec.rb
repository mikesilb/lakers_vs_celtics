require 'rails_helper'

describe Player do
  subject { described_class.new }
  team = Team.create(teamname: "Celtics", nbafinal_id: 11)

  it "is valid with valid attributes" do
    subject.team = team
    subject.lastname = "Garnett"
    subject.firstname = "Kevin"
    expect(subject).to be_valid
  end

  it "is not valid without a connected team" do
    subject.lastname = "Garnett"
    subject.firstname = "Kevin"
    expect(subject).to_not be_valid
  end

  it "is not valid without both a first name and a last name" do
    subject.team = team
    subject.firstname = "Kevin"
    expect(subject).to_not be_valid
  end
end
