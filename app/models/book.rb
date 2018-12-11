class Book < ApplicationRecord
  validates_presence_of :title, :pages, :pub_date
  has_many :book_authors, :dependent => :destroy
  has_many :authors, through: :book_authors
  has_many :reviews, :dependent => :destroy

  def self.top_3_books
    Book.joins(:reviews).select('books.*, avg(reviews.rating) as avg_book_rating').group("books.id").order("avg_book_rating").reverse_order.first(3)
  end

  def avg_rating
    reviews.average(:rating)
  end
  
  def self.top_3_reviews(book)
    book_reviews = Book.find(book.id).reviews
    book_reviews.order(:rating).reverse_order.first(3)
  end 

  def self.bottom_3_reviews(book)
    book_reviews = Book.find(book.id).reviews
    book_reviews.order(:rating).first(3)
  end 
end
