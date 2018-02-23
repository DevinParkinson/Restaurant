class CreateRestaurant < ActiveRecord::Migration[5.1]
  def self.up
    create_table :order do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
