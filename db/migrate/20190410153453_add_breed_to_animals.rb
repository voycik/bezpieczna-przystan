# frozen_string_literal: true

class AddBreedToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :breed, :string
  end
end
