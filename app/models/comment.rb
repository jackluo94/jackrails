class Comment < ApplicationRecord
  belongs_to :blog

  validates_presence_of :avatar_url, message: "must be fill in."

  validates :rating,
            numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
