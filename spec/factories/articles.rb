# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'About' }
    body { 'Lorem ipsum' }
    photo { 'Art.jpg' }
  end
end
