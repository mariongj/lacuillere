class CreateRestaurants < ActiveRecord::Migration
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true

  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.string :phone_number
      t.string :category

      t.timestamps null: false
    end
  end
end
