class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :rating, presence: true, inclusion: { in: [0,1,2,3,4,5] }, numericality: true
  validates :content, presence: true
end
