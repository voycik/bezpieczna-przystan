# frozen_string_literal: true

class AddPhotoToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :photo, :string
  end
end
