class CreateMushrooms < ActiveRecord::Migration
  def change
    create_table :mushrooms do |t|
      t.string :name
      t.string :properties
      t.string :image

      t.timestamps null: false
    end
  end
end
