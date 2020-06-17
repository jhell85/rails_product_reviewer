class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_orgin, presence: true
  before_save(:titleize_product)

  scope :recently_added, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(10)
  )}

  private 
    def titleize_product
      self.name = self.name.titleize
    end
end