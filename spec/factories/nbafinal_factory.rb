FactoryGirl.define do
  factory :nbafinal do
    year 2010
    numgames 7
    champion 'Lakers'
    mvp 'Kobe Bryant'
  end

  def self.reload
    self.factories.clear
  end

end
