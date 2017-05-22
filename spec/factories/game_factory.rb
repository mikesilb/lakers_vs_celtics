FactoryGirl.define do
  factory :game do
    nbafinal
    score "Celtics 89, Lakers 102"
  end

  def self.reload
    self.factories.clear
  end

end
