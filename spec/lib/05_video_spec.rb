require 'rails_helper'

describe Video do
  subject { described_class.new }
  mike = User.create(first_name: "Mike", last_name: "Silb", email: "ms@email.edu", password: "123456")
  nbafinal = Nbafinal.create(year: "2008", champion: "Celtics", numgames: 6)

  it "is valid with valid attribute" do
    subject.video = "https://www.youtube.com/embed/uqf13CnVVSo"
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
    subject.video = "https://wwwyoutube.com/embed/uqf13CnVVSo"
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to_not be_valid
  end
end
