# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  validates :image, presence: true, format: { with: /.(gif|jpg|png)\Z/i, message: 'Nieobsługiwany format. Wybierz plik .gif, .jpg, lub .png' }
  mount_uploader :image, ImageUploader
end
