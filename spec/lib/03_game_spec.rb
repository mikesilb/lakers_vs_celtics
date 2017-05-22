require 'rails_helper'

describe Game do
  subject { described_class.new }
  nbafinal = Nbafinal.create(year: "2008", champion: "Celtics", numgames: 6, mvp: "Paul Pierce")

  it "is valid with valid attributes" do
    subject.nbafinal = nbafinal
    subject.date = '2008-06-05'
    subject.score = "Lakers 88, Celtics 98"
    expect(subject).to be_valid
  end

  it "is valid even without a date" do
    subject.nbafinal = nbafinal
    subject.score = "Lakers 88, Celtics 98"
    expect(subject).to be_valid
  end

  it "is not valid without a score" do
    subject.nbafinal = nbafinal
    subject.date = '2008-06-05'
    expect(subject).to_not be_valid
  end

  it "is not valid without a connected NBA Finals" do
    subject.date = '2008-06-05'
    subject.score = "Lakers 88, Celtics 98"
    expect(subject).to_not be_valid
  end
end
