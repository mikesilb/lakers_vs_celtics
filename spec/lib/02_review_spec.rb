require 'rails_helper'

describe Review do
  subject { described_class.new }
  mike = User.create(first_name: "Mike", last_name: "Silb", email: "ms@email.edu", password: "123456")
  nbafinal = Nbafinal.create(year: "2008", champion: "Celtics", numgames: 6)
  game = Game.create(date: "06-05-2008", score: "Lakers 88, Celtics 98", nbafinal: nbafinal)

  it "is valid with valid attributes for an NBA Finals" do
    subject.rating = 3
    subject.body = "The NBA Finals was amazing."
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to be_valid
  end

  it "is valid with valid attributes for a specific game" do
    subject.rating = 3
    subject.body = "The NBA Finals was amazing."
    subject.user = mike
    subject.nbafinal = nbafinal
    subject.game_id = game
    expect(subject).to be_valid
  end

  it "is not valid without rating and body for an NBA Finals" do
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to_not be_valid
  end

  it "is not valid without rating and body for a specific game" do
    subject.user = mike
    subject.nbafinal = nbafinal
    subject.game_id = game
    expect(subject).to_not be_valid
  end

  it "is not valid with wrong rating for an NBA Finals" do
    subject.rating = 7
    subject.body = "The NBA Finals was amazing."
    subject.user = mike
    subject.nbafinal = nbafinal
    expect(subject).to_not be_valid
  end
  it "is not valid with wrong rating for a specific game" do
    subject.rating = 7
    subject.body = "This game was amazing."
    subject.user = mike
    subject.nbafinal = nbafinal
    subject.game_id = game
    expect(subject).to_not be_valid
  end
end
