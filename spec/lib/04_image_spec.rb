require 'rails_helper'

describe Image do
  subject { described_class.new }
  mike = User.create(first_name: "Mike", last_name: "Silb", email: "ms@email.edu", password: "123456")
  nbafinal = Nbafinal.create(year: "2008", champion: "Celtics", numgames: 6)

  it "is valid with valid attribute" do
    subject.image = "http://i.cdn.turner.com/nba/nba/2009/images/06/18/portrait608.jpg"
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to be_valid
  end

  it "is not valid without image" do
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid attribute" do
    subject.image = "http://i.cdn.turner.com/nba/nba/2009/images/06/18/portrait608jpg"
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to_not be_valid
  end
end
