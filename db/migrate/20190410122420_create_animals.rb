# frozen_string_literal: true

class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name, null: false, limit: 30
      t.string :type, null: false
      t.string :gender, null: false
      t.string :size, null: false
      t.string :purpose, null: false
      t.boolean :for_kids
      t.integer :age, null: false
      t.text :general_info, limit: 1000
      t.date :come_date, null: false
      t.date :vaccination_date
      t.date :sterilization_date

      t.timestamps
    end
  end
end
