# frozen_string_literal: true

Dog.create!(name: 'Example Dog',
            gender: 'male',
            size: 'medium',
            age: 5,
            purpose: 'yard',
            for_kids: true,
            photo: 'Dog.jpg',
            general_info: 'Cute dog',
            come_date: Date.new(2015, 12, 8),
            vaccination_date: Date.new(2013, 9, 5),
            breed: 'Poodle')

Cat.create!(name: 'Example Cat',
            gender: 'female',
            size: 'small',
            age: 2,
            purpose: 'house',
            for_kids: true,
            photo: 'Cat.img',
            general_info: 'Cute cat',
            come_date: Date.new(2017, 12, 8),
            vaccination_date: Date.new(2017, 9, 5),
            breed: 'Havana Brown')

30.times do |_n|
  name  = Faker::Name.name
  type  = %w[Cat Dog].sample
  gender = Faker::Gender.binary_type
  size = %w[small medium large].sample
  age  = rand(1..20)
  purpose = %w[house yard].sample
  for_kids = Faker::Boolean.boolean
  photo = "#{type}.png"
  general_info = Faker::Lorem.sentence
  come_date = Faker::Date.backward(14)
  vaccination_date = Faker::Date.backward(140)
  sterilization_date = Faker::Date.backward(140)
  breed = type == 'Dog' ? Faker::Creature::Dog.breed : Faker::Creature::Cat.breed
  Animal.create!(name: name,
                 type: type,
                 gender: gender,
                 size: size,
                 age: age,
                 purpose: purpose,
                 for_kids: for_kids,
                 photo: photo,
                 general_info: general_info,
                 come_date: come_date,
                 vaccination_date: vaccination_date,
                 sterilization_date: sterilization_date)
end
