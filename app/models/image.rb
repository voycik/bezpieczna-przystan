class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  validates :file, presence: true, format: { with: /.(gif|jpg|png)\Z/i, message: 'Nieobsługiwany format. Wybierz plik .gif, .jpg, lub .png' }
end
