class Book < ApplicationRecord
  validates_presence_of :title, :pages, :pub_date
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  def avg_rating
    reviews.average(:rating)
  end

end
