class User < ApplicationRecord
  has_many :review
  validates_presence_of :username

  def sort_asc_reviews
    review.order(:updated_at)
  end 

  def sort_dec_reviews
    review.order(:updated_at).reverse_order
  end 
end
