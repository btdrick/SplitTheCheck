class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :will_split
      t.integer :wont_split

      t.timestamps
    end
  end
end
