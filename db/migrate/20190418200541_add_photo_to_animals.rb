# frozen_string_literal: true

class AddPhotoToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :photo, :string
  end
end
