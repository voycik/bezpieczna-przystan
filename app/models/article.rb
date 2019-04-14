# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true, length: { minimum: 10 }
  validates :photo, allow_blank: true, format: { with: /.(gif|jpg|png)\Z/i, message: 'Nieobsługiwany format. Wybierz plik .gif, .jpg, lub .png' }
end
