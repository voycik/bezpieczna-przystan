# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    file { 'MyString' }
    animal { nil }
    article { nil }
  end
end
