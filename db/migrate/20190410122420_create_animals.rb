class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :type
      t.string :gender
      t.string :size
      t.string :purpose
      t.boolean :for_kids
      t.integer :age
      t.string :photo
      t.text :general_info
      t.date :come_date
      t.date :vaccination_date
      t.date :sterilization_date

      t.timestamps
    end
  end
end
