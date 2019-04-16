# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true, length: { minimum: 10 }
  has_many :images, as: :imageable
  attr_accessor :image_data
  accepts_nested_attributes_for :images
end
