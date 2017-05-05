require 'rails_helper'

describe Review do
  subject { described_class.new }
  mike = User.create(first_name: "Mike", last_name: "Silb", email: "ms@email.edu", password: "123456")
  nbafinal = Nbafinal.create(year: "2008", champion: "Celtics", numgames: 6)


  it "is valid with valid attributes" do
    subject.rating = 3
    subject.body = "This color is swell."
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to be_valid
  end

  it "is not valid without rating and body and color" do
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to_not be_valid
  end

  it "is not valid with wrong rating" do
    subject.rating = 7
    subject.body = "This colour is swell."
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to_not be_valid
  end
end
