FactoryGirl.define do
  factory :player do
    team
    lastname "Bryant"
    firstname "Kobe"
  end

  def self.reload
    self.factories.clear
  end
end
