class Book < ApplicationRecord
  validates_presence_of :title, :pages, :pub_date
  has_many :author, through: :book_author
end
