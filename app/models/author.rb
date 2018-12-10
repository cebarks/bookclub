class Author < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :book_authors, :dependent => :destroy
  has_many :books, through: :book_authors

  def top_review
    reviews.order(:rating).last
  end

  def reviews
    ids = books.pluck(:id)
    Review.where(book_id: ids).order(:rating)
  end
end
