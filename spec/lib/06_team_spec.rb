require 'rails_helper'

describe Team do
  subject { described_class.new }
  nbafinal = Nbafinal.create(year: "2008", champion: "Celtics", numgames: 6, mvp: "Paul Pierce")

  it "is valid with valid attributes" do
    subject.nbafinal = nbafinal
    subject.teamname = 'Lakers'
    expect(subject).to be_valid
  end

  it "is valid with valid attributes" do
    subject.nbafinal = nbafinal
    subject.teamname = 'Celtics'
    expect(subject).to be_valid
  end

  it "is valid with valid attributes" do
    subject.nbafinal = nbafinal
    subject.teamname = 'Bulls'
    expect(subject).to_not be_valid
  end

  it "is not valid without a connected NBA Finals" do
    subject.teamname = 'Lakers'
    expect(subject).to_not be_valid
  end
end
