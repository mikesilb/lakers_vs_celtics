require 'rails_helper'

describe Nbafinal do
  subject { described_class.new }

  it "is valid with valid attributes_and_mvp" do
    subject.year = 2010
    subject.num_games = 7
    subject.champion = "Lakers"
    subject.mvp = "Kobe Bryant"
    expect(subject).to be_valid
  end

  it "is valid with valid attributes_and_no_mvp" do
    subject.year = 2010
    subject.num_games = 7
    subject.champion = "Lakers"
    expect(subject).to be_valid
  end

  it "is not valid without a year" do
    subject.num_games = 7
    subject.champion = "Lakers"
    expect(subject).to_not be_valid
  end

  it "is not valid without a set number of games" do
    subject.year = 2010
    subject.champion = "Lakers"
    expect(subject).to_not be_valid
  end

  it "is not valid without a champion" do
    subject.year = 2010
    subject.num_games = 7
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid year_1" do
    subject.year = 1940
    subject.num_games = 7
    subject.champion = "Lakers"
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid year_2" do
    subject.year = 2025
    subject.num_games = 7
    subject.champion = "Lakers"
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid number of games_1" do
    subject.year = 2010
    subject.num_games = 15
    subject.champion = "Lakers"
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid number of games_2" do
    subject.year = 2010
    subject.num_games = 2
    subject.champion = "Lakers"
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid championship team" do
    subject.year = 2010
    subject.num_games = 7
    subject.champion = "Bulls"
    expect(subject).to_not be_valid
  end
end
