class Blog < ApplicationRecord
  has_many :comments

  validates_presence_of :title, :author, :content, message: "must be fill in."

  paginates_per 10
end
