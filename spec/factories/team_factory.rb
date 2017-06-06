FactoryGirl.define do
  factory :team do
    nbafinal
    teamname "Lakers"
  end

  def self.reload
    self.factories.clear
  end

end
