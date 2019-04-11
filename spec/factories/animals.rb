FactoryBot.define do
  factory :dog do
    name {'SampleDog'}
    type {'Dog'}
    gender {'Male'}
    size {'medium'}
    age {5}
    purpose {'yard'}
    for_kids {true}
    photo {'Dog.jpg'}
    general_info {'Cute dog'}
    come_date {Date.new(2015, 12, 8)}
    vaccination_date {Date.new(2013, 9, 5)}
    breed {'Poodle'}
  end

  factory :cat do
    name {'SampleCat'}
    type {'Cat'}
    gender {'Female'}
    size {'Small'}
    age {3}
    purpose {'house'}
    for_kids {false}
    photo {'Cat.jpg'}
    general_info {'Cute cat'}
    come_date {Date.new(2017, 12, 8)}
    vaccination_date {Date.new(2017, 9, 5)}
    breed {'Poodle'}
  end
end
