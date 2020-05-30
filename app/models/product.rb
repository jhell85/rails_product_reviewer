class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  before_save(:titleize_product)

  private 
    def titleize_product
      self.name = self.name.titleize
    end
end