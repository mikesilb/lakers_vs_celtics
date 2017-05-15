require 'rails_helper'

describe Game do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.date = 'Thu, 05 Jun 2008'
    subject.score = "Lakers 88, Celtics 98"
    subject.nbafinal_id = 11
  end

  it "is not valid without a date" do
    subject.score = "Lakers 88, Celtics 98"
    subject.nbafinal_id = 11
    expect(subject).to_not be_valid
  end

  it "is not valid without a score" do
    subject.date = 'Thu, 05 Jun 2008'
    subject.nbafinal_id = 11
    expect(subject).to_not be_valid
  end

  it "is not valid without a connected NBA Finals" do
    subject.date = 'Thu, 05 Jun 2008'
    subject.score = "Lakers 88, Celtics 98"
    expect(subject).to_not be_valid
  end


end
