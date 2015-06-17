class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.references :restaurant, index: true, foreign_key: true
      t.integer :rating

      t.timestamps null: false
    end
  end
end
