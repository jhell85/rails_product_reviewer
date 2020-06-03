class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, length: { maximum: 250, minimum: 50 } 
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end