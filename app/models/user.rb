class User < ApplicationRecord
  has_many :review
  validates_presence_of :username
end
