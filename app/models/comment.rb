class Comment < ApplicationRecord
  belongs_to :dog
  validates :review, presence: true
end
