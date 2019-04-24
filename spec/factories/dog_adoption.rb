# frozen_string_literal: true

FactoryBot.define do
  factory :dog_adoption do
    name { 'John Smith' }
    email { 'john@exapmle.com' }
    phone_number { '123123123' }
    where_keep { 'Home' }
    free_time { 'Running' }
    children_age { '10 - 12' }
    other_animals { 'no' }
    had_dog { 'yes' }
    hours_alone { '8' }
    comments { 'I really like dogs' }
    dog_name { 'Example Dog' }
  end
end
