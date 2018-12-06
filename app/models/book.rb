class Book < ApplicationRecord
  validates_presence_of :title, :pages, :pub_date
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  def self.top_3_books
    limit(3).joins(:reviews).order('reviews.rating').select(:'author.name')
  end
end
