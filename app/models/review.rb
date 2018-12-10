class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates_presence_of :title, :description
  validates_uniqueness_of :book_id, scope: [:user_id]
  validates_uniqueness_of :user_id, scope: [:book_id]
end
