FactoryGirl.define do
  factory :game do
    date 'Thu, 05 Jun 2008'
    score "Lakers 88, Celtics 98"
    nbafinal_id 11
  end

  def self.reload
    self.factories.clear
  end

end
