# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true, length: { minimum: 10 }
  has_many :images, as: :imageable
end
