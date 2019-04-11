# frozen_string_literal: true

class Animal < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :gender, presence: true
  validates :size, presence: true
  validates :purpose, presence: true
  validates :for_kids, inclusion: { in: [true, false] }
  validates :age, presence: true, numericality: { less_than_or_equal_to: 30, only_integer: true }
  validates :general_info, length: { maximum: 1000 }
  validates :come_date, presence: true
  validates :breed, presence: true
  validates :photo, presence: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'Nieobsługiwany format. Wybierz plik .gif, .jpg, lub .png' }

end
